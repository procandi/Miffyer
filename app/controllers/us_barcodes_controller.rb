class UsBarcodesController < ApplicationController
  before_action :set_us_barcode, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  #use for android search site current uid. @xieyinghua
  def site_current_uid
    id=params[:id]
    if id=='wt1'
      site='洗滌台一'
    elsif id=='wt2'
      site='洗滌台二'
    elsif id=='wt3'
      site='洗滌台三'
    elsif id=='wm1'
      site=='洗滌機一'
    elsif id=='wm2'
      site='洗滌機二'
    elsif id=='wm3'
      site='洗滌機三'
    elsif id=='wm4'
      site='洗滌機四'
    elsif id=='wm5'
      site='洗滌機五'
    elsif id=='wm6'
      site='洗滌機六'
    elsif id=='wm7'
      site='洗滌機七'
    else
      site=id
    end  
    @us_barcode=UsBarcode.where("site='#{site}'").order("id desc").first

    respond_to do |format|
      if @us_barcode!=nil
        format.html { render :show }
        format.json { render json: @us_barcode, status: :ok }
      else
        format.html { render :show }
        format.json { render json: nil, status: :ok }
      end
    end
  end

  #write excel. @xieyinghua
  def search_writeexcel() 
    # Create a new Excel Worksense
    if Rails.env.production?
      #@wlink='../us_barcodes.xls' #tomcat version.
      @wlink='public/us_barcodes.xls'
      @rlink='../us_barcodes.xls'
    else
      @wlink='public/us_barcodes.xls'
      @rlink='../us_barcodes.xls'
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
    worksheet.write(0, 0, t(:sortid, :scope=>[:activerecord,:attributes,:us_barcode]),format)
    worksheet.write(0, 1, t(:uid, :scope=>[:activerecord,:attributes,:us_barcode]),format)
    worksheet.write(0, 2, t(:site, :scope=>[:activerecord,:attributes,:us_barcode]),format)
    worksheet.write(0, 3, t(:scandate, :scope=>[:activerecord,:attributes,:us_barcode]),format)
    worksheet.write(0, 4, t(:scantime, :scope=>[:activerecord,:attributes,:us_barcode]),format)
    

    #write body
    @results_where.each_with_index do |result,i|
      row=i+1

      worksheet.write(row, 0, row)
      worksheet.write(row, 1, result.uid)
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
      @results_where=UsBarcode.all.order('scandate desc, scantime desc')
      @results_where=@results_where.where('uid'=>params[:uid_text]) if params[:uid_text]!=""
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

  # GET /us_barcodes
  # GET /us_barcodes.json
  def index
    @us_barcodes = UsBarcode.all
  end

  # GET /us_barcodes/1
  # GET /us_barcodes/1.json
  def show
  end

  # GET /us_barcodes/new
  def new
    @us_barcode = UsBarcode.new
  end

  # GET /us_barcodes/1/edit
  def edit
  end

  # POST /us_barcodes
  # POST /us_barcodes.json
  def create
    @us_barcode = UsBarcode.new(us_barcode_params)

    respond_to do |format|
      if @us_barcode.save
        format.html { redirect_to @us_barcode, notice: 'Us barcode was successfully created.' }
        format.json { render :show, status: :created, location: @us_barcode }
      else
        format.html { render :new }
        format.json { render json: @us_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /us_barcodes
  # POST /us_barcodes.json
  def create
    dnow=Date.today.strftime("%Y/%m/%d")
    tnow=Time.now.strftime("%H:%M:%S")
    if params[:site_text]!=nil
      #create from page query. @xieyinghua
      new_us_barcode_params=us_barcode_params
      new_us_barcode_params[:site]=params[:site_text] if params[:site_text]!=nil
      new_us_barcode_params[:scandate]=dnow
      new_us_barcode_params[:scantime]=tnow

      @us_barcode = UsBarcode.new(new_us_barcode_params)
    else
      #create from cros post. @xieyinghua
      new_us_barcode_params=UsBarcode.new
      new_us_barcode_params[:site]=params[:site]
      new_us_barcode_params[:uid]=params[:uid]
      if params[:d]==nil
        new_us_barcode_params[:scandate]=dnow
      else
        new_us_barcode_params[:scandate]=params[:d]
      end
      if params[:t]==nil
        new_us_barcode_params[:scantime]=tnow
      else
        new_us_barcode_params[:scantime]=params[:t]
      end

      @us_barcode=new_us_barcode_params
    end


    respond_to do |format|
      if @us_barcode.save
        format.html { redirect_to @us_barcode, notice: 'Us barcode was successfully created.' }
        format.json { render :show, status: :created, location: @us_barcode }
      else
        format.html { render :new }
        format.json { render json: @us_barcode.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /us_barcodes/1
  # PATCH/PUT /us_barcodes/1.json
  def update
    respond_to do |format|
      if @us_barcode.update(us_barcode_params)
        format.html { redirect_to @us_barcode, notice: 'Us barcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @us_barcode }
      else
        format.html { render :edit }
        format.json { render json: @us_barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /us_barcodes/1
  # DELETE /us_barcodes/1.json
  def destroy
    @us_barcode.destroy
    respond_to do |format|
      #刪完後要回search頁。 @xieyinghua
      format.html { redirect_to us_barcode_search_path, notice: 'Us barcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_us_barcode
      @us_barcode = UsBarcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def us_barcode_params
      params.require(:us_barcode).permit(:uid, :site, :scandate, :scantime)
    end
end
