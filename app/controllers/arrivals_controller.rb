class ArrivalsController < ApplicationController
  before_action :set_arrival, only: [:show, :edit, :update, :destroy]


  def query
=begin
  client = TinyTds::Client.new username: @dbid, password: @dbpw, host: @dbhost, database: @dbsid

  result = client.execute("select top 1 * from patient1 where ptn_id='00000048';")
  result.each_with_index do |row, i|
    @test=row['ptn_id']
    @test1=row['ptn_name']
    @test2=row['ptn_id_id']
    @test3=row['sex']
    @test4=row['birth_date']  
  end
  result.cancel
=end
  end

  def result
    if params[:search]=='yes' and (params[:pid]!="" || params[:pname]!="")
      #if pid is null, use name for search on remote database server.
      if params[:pid]!=""
        pid=params[:pid] 

        #search patient data by name.
        patient=Patient.where("pid like '%#{pid}%'").first
        if patient!=nil
          pid=patient.pid 
          pname=patient.pname 
        else
          pname=params[:pname]
        end

      elsif params[:pname]!="" && params[:pid]==""
        pname=params[:pname]

        #search patient data by name.
        patient=Patient.where("pname like '%#{pname}%'").first
        if patient!=nil
          pid=patient.pid 
          pname=patient.pname 
        else
          pid=''
        end
      end


      #query. @xieyinghua
      @pid=pid
      @pname=pname

      #search arrival data.
      arrivals=Arrival.all
      arrivals=arrivals.where("list like '%#{@pid},%'")

      arrival=arrivals.first
      if arrival==nil
        @mainsite='找不到此客戶資訊'
      else
        case arrival.site
        when '3FUS1'
          @mainsite='三樓前台'
        when '3FUS2'
          @mainsite='三樓超音波'
        when '3FXRay'
          @mainsite='三樓X光'
        when '5FBMD'
          @mainsite='五樓骨密'
        when '5FUS'
          @mainsite='五樓超音波'
        end
      end

      #write result to file. @xieyinghua
      #search_writeexcel()
    else
      @pid=''
      @pname=''
      @mainsite='您尚未輸入任何條件'

      #依客戶要求填入預設的日期為當日日期
      #params[:begindate_text]=Date.today.strftime("%Y-%m-%d")
      #params[:enddate_text]=Date.today.strftime("%Y-%m-%d")
    end
  end

  def unitlist
    case params[:exam]
    when '3F_前台超音波'
      find = Arrival.find_by(:site=>'3FUS1')
    when '3F_超音波'
      find = Arrival.find_by(:site=>'3FUS2')
    when '3F_X光檢查'
      find = Arrival.find_by(:site=>'3FXRay')
    when '5F_超音波'
      find = Arrival.find_by(:site=>'5FUS')
    when '5F_骨密'
      find = Arrival.find_by(:site=>'5FBMD')
    end

    if find==nil
      @find_count=0
      @find_examing='無人排撿中'
      @find_list=[]
    else
      @find_count = find.count
      if @find_count==0
        @find_count=0
        @find_examing='無人排撿中'
        @find_list=[]
      else
        
        @find_all = find.list
        @find_examing = @find_all.gsub(/,.*/,'')
        patient=Patient.where("pid='#{@find_examing}'").first
        if patient!=nil
          @find_examing_name = patient.pname
        end

        @find_list=@find_all.gsub("#{@find_examing},",'')
        @find_list=@find_list.split(',')
        @find_list_name=Hash.new
        @find_list.each_with_index(){|find,i|
          patient=Patient.where("pid='#{find}'").first
          if patient!=nil
            @find_list_name[i] = patient.pname
          end
        }
      end
    end
  end

  def list
    s3FUS1 = Arrival.find_by(:site=>'3FUS1')
    @s3FUS1_count = s3FUS1.count
    #use only patient id
    #@s3FUS1_list = s3FUS1.list
    #user patient id and patient name
    @s3FUS1_list=Hash.new
    s3FUS1.list.split(',').each_with_index(){|find,i|
      patient=Patient.where("pid='#{find}'").first
      if patient!=nil
        @s3FUS1_list[i] = "#{find}#{patient.pname}"
      else
        @s3FUS1_list[i] = "#{find}"
      end
    }


    s3FUS2 = Arrival.find_by(:site=>'3FUS2')
    @s3FUS2_count = s3FUS2.count
    #use only patient id
    #@s3FUS2_list = s3FUS2.list
    #user patient id and patient name
    @s3FUS2_list=Hash.new
    s3FUS2.list.split(',').each_with_index(){|find,i|
      patient=Patient.where("pid='#{find}'").first
      if patient!=nil
        @s3FUS2_list[i] = "#{find}#{patient.pname}"
      else
        @s3FUS2_list[i] = "#{find}"
      end
    }


    s3FXRay = Arrival.find_by(:site=>'3FXRay')
    @s3FXRay_count = s3FXRay.count
    #use only patient id
    #@s3FXRay_list = s3FXRay.list
    #user patient id and patient name
    @s3FXRay_list=Hash.new
    s3FXRay.list.split(',').each_with_index(){|find,i|
      patient=Patient.where("pid='#{find}'").first
      if patient!=nil
        @s3FXRay_list[i] = "#{find}#{patient.pname}"
      else
        @s3FXRay_list[i] = "#{find}"
      end
    }


    s5FUS = Arrival.find_by(:site=>'5FUS')
    @s5FUS_count = s5FUS.count
    #use only patient id
    #@s5FUS_list = s5FUS.list
    #user patient id and patient name
    @s5FUS_list=Hash.new
    s5FUS.list.split(',').each_with_index(){|find,i|
      patient=Patient.where("pid='#{find}'").first
      if patient!=nil
        @s5FUS_list[i] = "#{find}#{patient.pname}"
      else
        @s5FUS_list[i] = "#{find}"
      end
    }


    s5FBMD = Arrival.find_by(:site=>'5FBMD')
    @s5FBMD_count = s5FBMD.count
    #use only patient id
    #@s5FBMD_list = s5FBMD.list
    #user patient id and patient name
    @s5FBMD_list=Hash.new
    s5FBMD.list.split(',').each_with_index(){|find,i|
      patient=Patient.where("pid='#{find}'").first
      if patient!=nil
        @s5FBMD_list[i] = "#{find}#{patient.pname}"
      else
        @s5FBMD_list[i] = "#{find}"
      end
    }

  end


  # GET /arrivals
  # GET /arrivals.json
  def index
    @arrivals = Arrival.all
  end

  # GET /arrivals/1
  # GET /arrivals/1.json
  def show
  end

  # GET /arrivals/new
  def new
    @arrival = Arrival.new
  end

  # GET /arrivals/1/edit
  def edit
  end

  # POST /arrivals
  # POST /arrivals.json
  def create
    @arrival = Arrival.new(arrival_params)

    respond_to do |format|
      if @arrival.save
        format.html { redirect_to @arrival, notice: 'Arrival was successfully created.' }
        format.json { render :show, status: :created, location: @arrival }
      else
        format.html { render :new }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arrivals/1
  # PATCH/PUT /arrivals/1.json
  def update
    respond_to do |format|
      if @arrival.update(arrival_params)
        format.html { redirect_to @arrival, notice: 'Arrival was successfully updated.' }
        format.json { render :show, status: :ok, location: @arrival }
      else
        format.html { render :edit }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arrivals/1
  # DELETE /arrivals/1.json
  def destroy
    @arrival.destroy
    respond_to do |format|
      format.html { redirect_to arrivals_url, notice: 'Arrival was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrival
      @arrival = Arrival.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arrival_params
      params.require(:arrival).permit(:site, :count, :list)
    end
end
