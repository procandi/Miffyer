class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]


  #write excel. @xieyinghua
  def writeexcel() 
    # Create a new Excel Worksense
    if Rails.env.production?
      #@wlink='../List.xls'  #tomcat version
      @wlink='public/List.xls'
      @rlink='../List.xls'
    else
      @wlink='public/List.xls'
      @rlink='../List.xls'
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
    worksheet.set_column(0, 0, 20)
    worksheet.write(0, 1, '排班類別', format)
    worksheet.write(1, 0, '代碼', format)
    worksheet.write(1, 1, '名稱', format)
    worksheet.write(1, 2, '編號', format)
    worksheet.set_column('AG:AG', 70)
    

    #write body
    row=1
    @works.each(){|work|
      row+=1


      worksheet.write(row, 0, work.wid, format)
      worksheet.write(row, 1, work.wname, format)
      worksheet.write(row, 2, work.wsort, format)

    }


    # write to file
    worksense.close
  end



  # GET /works
  # GET /works.json
  def index
    @works = Work.all.order('wsort asc')

    writeexcel()
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:wid, :wname, :wsort)
    end
end
