class PtBarcodesController < ApplicationController
  before_action :set_pt_barcode, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  #write excel. @xieyinghua
  def search_writeexcel() 
    # Create a new Excel Worksense
    if Rails.env.production?
      #@wlink='../pt_barcodes.xls' #tomcat version.
      @wlink='public/pt_barcodes.xls'
      @rlink='../pt_barcodes.xls'
    else
      @wlink='public/pt_barcodes.xls'
      @rlink='../pt_barcodes.xls'
    end
    worksense = WriteExcel.new(@wlink)


    # Add worksheet(s)
    worksheet  = worksense.add_worksheet

    # Add and define a format
    format = worksense.add_format
    format.set_bold
    format.set_align('center')
    format.set_text_warp(true)


    # write title
    worksheet.write(0, 0, t(:sortid, :scope=>[:activerecord,:attributes,:pt_barcode]),format)
    worksheet.write(0, 1, t(:pid, :scope=>[:activerecord,:attributes,:pt_barcode]),format)
    worksheet.write(0, 2, t(:site, :scope=>[:activerecord,:attributes,:pt_barcode]),format)
    worksheet.write(0, 3, t(:scandate, :scope=>[:activerecord,:attributes,:pt_barcode]),format)
    worksheet.write(0, 4, t(:scantime, :scope=>[:activerecord,:attributes,:pt_barcode]),format)
    

    #write body
    @results_where.each_with_index do |result,i|
      row=i+1

      worksheet.write(row, 0, row)
      worksheet.write(row, 1, result.pid)
      worksheet.write(row, 2, result.site)
      worksheet.write(row, 3, result.scandate)
      worksheet.write(row, 4, result.scantime.strftime("%T"))
    end


    # write to file
    worksense.close
  end
  def search
    @results_where=Hash.new

    if params[:search]=='yes'
      #query. @xieyinghua
      @results_where=PtBarcode.all.order('scandate desc, scantime desc')
      @results_where=@results_where.where('pid'=>params[:pid_text]) if params[:pid_text]!=""
      @results_where=@results_where.where('site'=>params[:site_text]) if params[:site_text]!=""
      @results_where=@results_where.where("scandate>='#{params[:begindate_text]}'") if params[:begindate_text]!="" and params[:begindate_text]!=nil
      @results_where=@results_where.where("scandate<='#{params[:enddate_text]}'") if params[:enddate_text]!="" and params[:enddate_text]!=nil


      #write result to file. @xieyinghua
      search_writeexcel()
    else
      #依客戶要求填入預設的日期為當日日期
      params[:begindate_text]=Date.today.strftime("%Y-%m-%d")
      params[:enddate_text]=Date.today.strftime("%Y-%m-%d")
    end
  end

  # GET /pt_barcodes
  # GET /pt_barcodes.json
  def index
    @pt_barcodes = PtBarcode.all
  end

  # GET /pt_barcodes/1
  # GET /pt_barcodes/1.json
  def show
  end

  # GET /pt_barcodes/new
  def new
    @pt_barcode = PtBarcode.new
  end

  # GET /pt_barcodes/1/edit
  def edit
  end

  # POST /us_barcodes
  # POST /us_barcodes.json
  def create
    dnow=Date.today.strftime("%Y/%m/%d")
    tnow=Time.now.strftime("%H:%M:%S")
    if params[:query]!=nil
      #create from page query. @xieyinghua
      new_pt_barcode_params=pt_barcode_params
      new_pt_barcode_params[:site]=params[:site] if params[:site]!=nil
      new_pt_barcode_params[:scandate]=dnow
      new_pt_barcode_params[:scantime]=tnow

      @pt_barcode = PtBarcode.new(new_pt_barcode_params)



      #create to arrival. @xieyinghua
      mainsite=pt_barcode_params[:site]
      pid=pt_barcode_params[:pid]

      #找找有沒有任何地方有
      arrivals=Arrival.where("list like '%#{pid},%'")
      if arrivals.count==0

        #本客戶在任何位置裡都找不到，那就是直接把本客戶加到目前掃的這個位置
        arrivals_sub=Arrival.where("site='#{mainsite}'").first
        arrivals_sub.list="#{arrivals_sub.list}#{pid},"
        arrivals_sub.count+=1
        arrivals_sub.save

      else
        #存一下有找到這筆資料的位置
        foundsite=arrivals.first.site

        #既然有地方有，那先確認一下是目前的位置有，還是在別的位置有
        arrivals=Arrival.where("site='#{mainsite}' and list like '%#{pid},%'")
        if arrivals.count==0

          #本客戶在目前的位置裡找不到，那代表這筆資料在別的檢查室，直接從別筆刪掉本客戶，並在這位置加上本客戶
          arrivals_sub=Arrival.where("site='#{foundsite}'").first
          arrivals_sub.list=arrivals_sub.list.gsub("#{pid},","")
          arrivals_sub.count-=1
          arrivals_sub.save

          arrivals_sub=Arrival.where("site='#{mainsite}'").first
          arrivals_sub.list="#{arrivals_sub.list}#{pid},"
          arrivals_sub.count+=1
          arrivals_sub.save

        else

          #本客戶在目前的位置裡有，再刷一次就代表要刷退，在這位置把本客戶去掉
          arrivals_sub=Arrival.where("site='#{foundsite}'").first
          arrivals_sub.list=arrivals_sub.list.gsub("#{pid},","")
          arrivals_sub.count-=1
          arrivals_sub.save

        end
      end
    else
      #create from cros post. @xieyinghua
      new_pt_barcode_params=PtBarcode.new
      new_pt_barcode_params[:site]=params[:site]
      new_pt_barcode_params[:pid]=params[:pid]
      if params[:d]==nil
        new_pt_barcode_params[:scandate]=dnow
      else
        new_pt_barcode_params[:scandate]=params[:d]
      end
      if params[:t]==nil
        new_pt_barcode_params[:scantime]=tnow
      else
        new_pt_barcode_params[:scantime]=params[:t]
      end

      @pt_barcode=new_pt_barcode_params



      #create to arrival. @xieyinghua
      mainsite=params[:site]
      pid=params[:pid]

      #找找有沒有任何地方有
      arrivals=Arrival.where("list like '%#{pid},%'")
      if arrivals.count==0

        #本客戶在任何位置裡都找不到，那就是直接把本客戶加到目前掃的這個位置
        arrivals_sub=Arrival.where("site='#{mainsite}'").first
        arrivals_sub.list="#{arrivals_sub.list}#{pid},"
        arrivals_sub.count+=1
        arrivals_sub.save

      else
        #存一下有找到這筆資料的位置
        foundsite=arrivals.first.site

        #既然有地方有，那先確認一下是目前的位置有，還是在別的位置有
        arrivals=Arrival.where("site='#{mainsite}' and list like '%#{pid},%'")
        if arrivals.count==0

          #本客戶在目前的位置裡找不到，那代表這筆資料在別的檢查室，直接從別筆刪掉本客戶，並在這位置加上本客戶
          arrivals_sub=Arrival.where("site='#{foundsite}'").first
          arrivals_sub.list=arrivals_sub.list.gsub("#{pid},","")
          arrivals_sub.count-=1
          arrivals_sub.save

          arrivals_sub=Arrival.where("site='#{mainsite}'").first
          arrivals_sub.list="#{arrivals_sub.list}#{pid},"
          arrivals_sub.count+=1
          arrivals_sub.save

        else

          #本客戶在目前的位置裡有，再刷一次就代表要刷退，在這位置把本客戶去掉
          arrivals_sub=Arrival.where("site='#{foundsite}'").first
          arrivals_sub.list=arrivals_sub.list.gsub("#{pid},","")
          arrivals_sub.count-=1
          arrivals_sub.save

        end
      end

      
    end



    #確認一下本機有沒有這個客戶的基本資料，沒有就到遠端把客戶資訊找出來，然後存到本機
    begin
      client = TinyTds::Client.new username: @@dbid, password: @@dbpw, host: @@dbhost, database: @@dbsid, login_timeout: 5
    rescue
      client=nil
    end
    if client!=nil
      new_pid=''
      new_pname=''
      new_pidid=''
      new_sex=''
      new_birthdate=''
      while pid.length!=8
        pid='0'+pid
      end

      #找遠端病人資訊
      result = client.execute("select top 1 * from patient1 where ptn_id='#{pid}' and ptn_name!='';")
      result.each_with_index do |row, i|
        new_pid=row['ptn_id']
        new_pname=row['ptn_name']
        new_pidid=row['ptn_id_id']
        new_sex=row['sex']
        new_birthdate=row['birth_date']
        break
      end
      result.cancel

      #找本機病人資訊，完全一致就沒有事了，有事的是沒有完全一致的
      begin
         new_birthdate=Date.parse(new_birthdate).to_s
      rescue
         new_birthdate=''
      end
      if new_birthdate=='' || new_birthdate==nil
        patient=Patient.where("pid='#{pid}' and pname='#{new_pname}' and sex='#{new_sex}' and birthday is null and address='#{new_pidid}'").first
      else
        patient=Patient.where("pid='#{pid}' and pname='#{new_pname}' and sex='#{new_sex}' and birthday='#{new_birthdate}' and address='#{new_pidid}'").first
      end
      if patient==nil

        #再確認一下是因為病人改過基資所以找不到，還是根本沒有資料
        patient=Patient.where("pid='#{pid}'").first
        if patient==nil
          #根本沒有這個病人的資料
          patient=Patient.new
          patient.pid=pid
          patient.pname=new_pname
          patient.address=new_pidid
          patient.sex=new_sex
          patient.birthday=new_birthdate
          patient.save
        else
          #有這個病人的資料，需更新
          patient.pname=new_pname
          patient.address=new_pidid
          patient.sex=new_sex
          patient.birthday=new_birthdate
          patient.save
        end

      end
    end


    respond_to do |format|
      if @pt_barcode.save
        format.html { redirect_to @pt_barcode, notice: 'Pt barcode was successfully created.' }
        format.json { render :show, status: :created, location: @pt_barcode }
      else
        format.html { render :new }
        format.json { render json: @pt_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pt_barcodes/1
  # PATCH/PUT /pt_barcodes/1.json
  def update
    respond_to do |format|
      if @pt_barcode.update(pt_barcode_params)
        format.html { redirect_to @pt_barcode, notice: 'Pt barcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @pt_barcode }
      else
        format.html { render :edit }
        format.json { render json: @pt_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pt_barcodes/1
  # DELETE /pt_barcodes/1.json
  def destroy
    @pt_barcode.destroy
    respond_to do |format|
      #刪完後要回search頁。 @xieyinghua
      format.html { redirect_to pt_barcode_search_path, notice: 'Pt barcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pt_barcode
      @pt_barcode = PtBarcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pt_barcode_params
      params.require(:pt_barcode).permit(:pid, :site, :scandate, :scantime)
    end
end
