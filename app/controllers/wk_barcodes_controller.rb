class WkBarcodesController < ApplicationController
  before_action :set_wk_barcode, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token


  #write excel. @xieyinghua
  def search_writeexcel() 
    # Create a new Excel Worksense
    if Rails.env.production?
      #@wlink='../wk_barcodes.xls' #tomcat version
      @wlink='public/wk_barcodes.xls'
      @rlink='../wk_barcodes.xls'
    else
      @wlink='public/wk_barcodes.xls'
      @rlink='../wk_barcodes.xls'
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
    worksheet.write(0, 0, t(:sortid, :scope=>[:activerecord,:attributes,:wk_barcode]),format)
    worksheet.write(0, 1, t(:wid, :scope=>[:activerecord,:attributes,:wk_barcode]),format)
    worksheet.write(0, 2, t(:site, :scope=>[:activerecord,:attributes,:wk_barcode]),format)
    worksheet.write(0, 3, t(:scandate, :scope=>[:activerecord,:attributes,:wk_barcode]),format)
    worksheet.write(0, 4, t(:scantime, :scope=>[:activerecord,:attributes,:wk_barcode]),format)
    

    #write body
    @results_where.each_with_index do |result,i|
      row=i+1

      worksheet.write(row, 0, row)
      worksheet.write(row, 1, result.wid)
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
      @results_where=WkBarcode.all.order('scandate desc, scantime desc')
      @results_where=@results_where.where('wid'=>params[:wid_text]) if params[:wid_text]!=""
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


  # GET /wk_barcodes
  # GET /wk_barcodes.json
  def index
    @wk_barcodes = WkBarcode.all.order('scandate desc, scantime desc')
  end

  # GET /wk_barcodes/1
  # GET /wk_barcodes/1.json
  def show
  end

  # GET /wk_barcodes/new
  def new
    @wk_barcode = WkBarcode.new
  end

  # GET /wk_barcodes/1/edit
  def edit
  end

  # POST /wk_barcodes
  # POST /wk_barcodes.json
  def create
    dnow=Date.today.strftime("%Y/%m/%d")
    tnow=Time.now.strftime("%H:%M:%S")
    if params[:site_text]!=nil
      #create from page query. @xieyinghua
      new_wk_barcode_params=wk_barcode_params
      new_wk_barcode_params[:site]=params[:site_text] if params[:site_text]!=nil

      @wk_barcode = WkBarcode.new(new_wk_barcode_params)


      #create to worksenses. @xieyinghua
      @worksense=Worksense.new()
      if wk_barcode_params[:scandate]==nil
        @worksense.begindate=dnow
      else
        @worksense.begindate=wk_barcode_params[:scandate]
      end
      if wk_barcode_params[:scantime]==nil
        @worksense.begintime=tnow
      else
        @worksense.begintime=wk_barcode_params[:scantime]
      end
      site_obj=Site.all.where("sname='#{params[:site_text]}'").first
      @worksense.site_id=site_obj.id
      @worksense.wid=wk_barcode_params[:wid]
      @worksense.save
    else
      #create from cros post. @xieyinghua
      new_wk_barcode_params=WkBarcode.new
      new_wk_barcode_params[:site]=params[:site]
      new_wk_barcode_params[:wid]=params[:wid]
      if params[:d]==nil
        new_wk_barcode_params[:scandate]=dnow
      else
        new_wk_barcode_params[:scandate]=params[:d]
      end
      if params[:t]==nil
        new_wk_barcode_params[:scantime]=tnow
      else
        new_wk_barcode_params[:scantime]=params[:t]
      end
      
      @wk_barcode=new_wk_barcode_params
    end


    

    respond_to do |format|
      if @wk_barcode.save
        format.html { redirect_to @wk_barcode, notice: 'Wk barcode was successfully created.' }
        format.json { render :show, status: :created, location: @wk_barcode }
      else
        format.html { render :new }
        format.json { render json: @wk_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wk_barcodes/1
  # PATCH/PUT /wk_barcodes/1.json
  def update
    new_wk_barcode_params=wk_barcode_params
    new_wk_barcode_params[:site]=params[:site_text] if params[:site_text]!=nil

    respond_to do |format|
      if @wk_barcode.update(new_wk_barcode_params)
        format.html { redirect_to @wk_barcode, notice: 'Wk barcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @wk_barcode }
      else
        format.html { render :edit }
        format.json { render json: @wk_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wk_barcodes/1
  # DELETE /wk_barcodes/1.json
  def destroy
    @wk_barcode.destroy
    respond_to do |format|
      #刪完後要回search頁。 @xieyinghua
      format.html { redirect_to wk_barcode_search_path, notice: 'Wk barcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wk_barcode
      @wk_barcode = WkBarcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wk_barcode_params
      params.require(:wk_barcode).permit(:wid, :site, :scandate, :scantime)
    end
end
