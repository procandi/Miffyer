class RfBarcodesController < ApplicationController
  before_action :set_rf_barcode, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token


  #write excel. @xieyinghua
  def search_writeexcel() 
    # Create a new Excel Worksense
    if Rails.env.production?
      #@wlink='../rf_barcodes.xls' #tomcat version.
      @wlink='public/rf_barcodes.xls'
      @rlink='../rf_barcodes.xls'
    else
      @wlink='public/rf_barcodes.xls'
      @rlink='../rf_barcodes.xls'
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
    worksheet.write(0, 0, t(:sortid, :scope=>[:activerecord,:attributes,:rf_barcode]),format)
    worksheet.write(0, 1, t(:rid, :scope=>[:activerecord,:attributes,:rf_barcode]),format)
    worksheet.write(0, 2, t(:site, :scope=>[:activerecord,:attributes,:rf_barcode]),format)
    worksheet.write(0, 3, t(:scandate, :scope=>[:activerecord,:attributes,:rf_barcode]),format)
    worksheet.write(0, 4, t(:scantime, :scope=>[:activerecord,:attributes,:rf_barcode]),format)
    

    #write body
    @results_where.each_with_index do |result,i|
      row=i+1

      worksheet.write(row, 0, row)
      worksheet.write(row, 1, result.rid)
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
      @results_where=RfBarcode.all.order('scandate desc, scantime desc')
      @results_where=@results_where.where('rid'=>params[:rid_text]) if params[:rid_text]!=""
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


  # GET /rf_barcodes
  # GET /rf_barcodes.json
  def index
    @rf_barcodes = RfBarcode.all.order('scandate desc, scantime desc')
  end

  # GET /rf_barcodes/1
  # GET /rf_barcodes/1.json
  def show
  end

  # GET /rf_barcodes/new
  def new
    @rf_barcode = RfBarcode.new
  end

  # GET /rf_barcodes/1/edit
  def edit
  end

  # POST /rf_barcodes
  # POST /rf_barcodes.json
  def create
    dnow=Date.today.strftime("%Y/%m/%d")
    tnow=Time.now.strftime("%H:%M:%S")
    if params[:site_text]!=nil
      #create from page query. @xieyinghua
      new_rf_barcode_params=rf_barcode_params
      new_rf_barcode_params[:site]=params[:site_text] if params[:site_text]!=nil
      new_rf_barcode_params[:scandate]=dnow
      new_rf_barcode_params[:scantime]=tnow

      @rf_barcode = RfBarcode.new(new_rf_barcode_params)
    else
      #create from cros post. @xieyinghua
      new_rf_barcode_params=RfBarcode.new
      new_rf_barcode_params[:site]=params[:site]
      new_rf_barcode_params[:rid]=params[:rid]
      if params[:d]==nil
        new_rf_barcode_params[:scandate]=dnow
      else
        new_rf_barcode_params[:scandate]=params[:d]
      end
      if params[:t]==nil
        new_rf_barcode_params[:scantime]=tnow
      else
        new_rf_barcode_params[:scantime]=params[:t]
      end

      @rf_barcode=new_rf_barcode_params
    end





    respond_to do |format|
      if @rf_barcode.save

        #update scopy site status and plus counting if status equals 鏡架上.  @xieyinghua
        @scopy=Scopy.find_by(:rid=>@rf_barcode.rid)

        #用web系統來計算一切，這方法不用了
=begin
        if @scopy!=nil

          if @scopy.status=='鏡架上'
            #first time get scopy from 鏡架上 to someone room. @xieyinghua



            #add usage counting. @xieyinghua
            @scopy.usage+=1
            #update scopy status. @xieyinghua
            @scopy.status=@rf_barcode.site


          elsif (@scopy.status=='Room1' || @scopy.status=='Room2' || @scopy.status=='Room3' || @scopy.status=='Room4' || @scopy.status=='Room5' || @scopy.status=='ERCP') && @rf_barcode.site==@scopy.status
            #second time get scopy from someone room to someone room. @xieyinghua


            #update worksense record for someone room. @xieyinghua
            @worksense = Worksense.find_by(:site_id=>site.find_by(:sname=>@scopy.status), :scopy_id=>@scopy.id, :begindate=>Time.now.strftime("%Y/%m/%d"), :conditions => ["begintime > ?", 30.minutes.ago])
            if @worksense!=nil
              @worksense.enddate = dnow
              @worksense.endtime = tnow
              @worksense.save
            end

            #update scopy status. @xieyinghua
            @scopy.status=@rf_barcode.site


          elsif (@scopy.status=='Room1' || @scopy.status=='Room2' || @scopy.status=='Room3' || @scopy.status=='Room4' || @scopy.status=='Room5' || @scopy.status=='ERCP') && @rf_barcode.site=='洗滌台'  
            #first time get scopy from someone room to 洗滌台. @xieyinghua


            #add worksense record for 洗滌台. @xieyinghua
            @worksense = Worksense.new
            @worksense.begindate = dnow
            @worksense.begintime = tnow
            @worksense.scopy_id = @scopy.id
            @worksense.site_id = Site.find_by(:sname=>@rf_barcode.site).id
            @worksense.save

            #update scopy status. @xieyinghua
            @scopy.status=@rf_barcode.site
          

          elsif @scopy.status=='洗滌台' && @rf_barcode.site=='洗滌機'
            #first time get scopy from 洗滌台 to 洗滌機. @xieyinghua


            #update worksense record for 洗滌台. @xieyinghua
            @worksense = Worksense.find_by(:site_id=>site.find_by(:sname=>@scopy.status), :scopy_id=>@scopy.id, :begindate=>Time.now.strftime("%Y/%m/%d")) 
            if @worksense!=nil
              @worksense.enddate = dnow
              @worksense.endtime = tnow
              @worksense.save
            end

            #add worksense record 洗滌機. @xieyinghua
            @worksense = Worksense.new
            @worksense.begindate = dnow
            @worksense.begintime = tnow
            @worksense.scopy_id = @scopy.id
            @worksense.site_id = Site.find_by(:sname=>@rf_barcode.site).id
            @worksense.save

            #first times input from 洗滌機.  @xieyinghua
            @scopy.status=@rf_barcode.site


          elsif @scopy.status=='洗滌機' && @rf_barcode.site==@scopy.status
            #second time get scopy from 洗滌機 to 洗滌機. @xieyinghua


            #update worksense record too. @xieyinghua
            @worksense = Worksense.find_by(:site_id=>site.find_by(:sname=>@scopy.status), :scopy_id=>@scopy.id, :begindate=>Time.now.strftime("%Y/%m/%d"))
            if @worksense!=nil
              @worksense.enddate = dnow
              @worksense.endtime = tnow
              @worksense.save
            end

            #second times input from 洗滌機, then go back to 鏡架上.  @xieyinghua
            @scopy.status='鏡架上'


          else


            #just update scopy status if any route lost.  @xieyinghua
            @scopy.status=@rf_barcode.site


          end


          @scopy.save

        end
=end

        #單純只更新內視鏡的狀況及增加次數
        if @scopy!=nil
          if @scopy.status.include?('洗滌機') && @rf_barcode.site==@scopy.status
            #內視鏡原本已在洗滌機，而且再刷來的這次也是洗滌機，代表要回鏡架上了
            @scopy.status='鏡架上'
          elsif @scopy.status=='鏡架上'
            #內視鏡原本在鏡架上，不管改去哪，都要增加使用次數一次
            #add usage counting. @xieyinghua
            @scopy.usage+=1

            #把最新的內視鏡刷碼位置，寫入目前的內視鏡所在位置
            @scopy.status=@rf_barcode.site
          else
            #其它情況，就是單純更新刷碼位置
            #把最新的內視鏡刷碼位置，寫入目前的內視鏡所在位置
            @scopy.status=@rf_barcode.site
          end
          @scopy.save
        end


        format.html { redirect_to @rf_barcode, notice: 'Rf barcode was successfully created.' }
        format.json { render :show, status: :created, location: @rf_barcode }
      else
        format.html { render :new }
        format.json { render json: @rf_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rf_barcodes/1
  # PATCH/PUT /rf_barcodes/1.json
  def update
    new_rf_barcode_params=rf_barcode_params
    new_rf_barcode_params[:site]=params[:site_text] if params[:site_text]!=nil

    respond_to do |format|
      if @rf_barcode.update(new_rf_barcode_params)
        format.html { redirect_to @rf_barcode, notice: 'Rf barcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @rf_barcode }
      else
        format.html { render :edit }
        format.json { render json: @rf_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rf_barcodes/1
  # DELETE /rf_barcodes/1.json
  def destroy
    @rf_barcode.destroy
    respond_to do |format|
      #刪完後要回search頁。 @xieyinghua
      format.html { redirect_to rf_barcode_search_path, notice: 'Rf barcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rf_barcode
      @rf_barcode = RfBarcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rf_barcode_params
      params.require(:rf_barcode).permit(:rid, :site, :scandate, :scantime)
    end
end
