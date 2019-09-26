class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    site=Site.all.where("sanem not like '洗滌機%'")
  end

  # GET /schedules/1/edit
  def editpage
    #確定一下要抓的日期是這個月，還是其它有被指定的月份
    @target_date=params[:target_date]
    if @target_date!=nil
      @target_date = DateTime.parse(@target_date)

      if params[:commit]=='下一天'
        @target_date+=1.day
      elsif params[:commit]=='前一天'
        @target_date-=1.day
      end
    else
      @target_date=Date.today
    end
    @d_now=@target_date.strftime("%Y/%m/%d")


    #初始化用得到的資料
    @works=Work.all.order("wsort asc")
    @results=Hash.new

    #整合班表，找出最近一天的班表
    @schedules_where=Schedule.all.where("workdate<='#{@d_now}'")
    @schedules_where=@schedules_where.order('workdate desc')
    @schedules_where=@schedules_where.limit(1)
    workdate=@schedules_where[0][:workdate]


    @schedules_result=Schedule.all.where("workdate='#{workdate}'")
    @schedules_result.each(){|schedule|
    
=begin  
      #原本的，有做格式的轉置
      if schedule.site=='洗滌台'
        wname='洗淨室'
      elsif schedule.site=='洗滌機'
        wname='消毒室'
      else
        wname=schedule.site
      end


      flag=false
      w=@works.where("wname='#{wname}'")
      if(w==[])
        w=@works.where("wname='#{wname}一'")
        if(w!=[])
          flag=true
          #p 'flag true'
        end
      end

      if schedule.workpart=='上午'
        #p flag
        if(flag)
          if(@results[:"p1_#{wname}一"]==nil)
            @results[:"p1_#{wname}一"]=schedule.uid
            #p wname+'一'
          elsif(@results[:"p1_#{wname}二"]==nil)
            @results[:"p1_#{wname}二"]=schedule.uid
            #p wname+'二'
          else
            @results[:"p1_#{wname}三"]=schedule.uid
            #p wname+'三'
          end
        else
          @results[:"p1_#{wname}"]=schedule.uid
          #p wname
        end
      elsif schedule.workpart=='下午'
        if(flag)
          if(@results[:"p2_#{wname}一"]==nil)
            @results[:"p2_#{wname}一"]=schedule.uid
          elsif(@results[:"p2_#{wname}二"]==nil)
            @results[:"p2_#{wname}二"]=schedule.uid
          else
            @results[:"p2_#{wname}三"]=schedule.uid
          end
        else
          @results[:"p2_#{wname}"]=schedule.uid
        end
      end
=end
      #新的，不做格式的轉置
      wname=schedule.site.gsub(/洗滌機/,'消毒室').gsub(/洗滌台/,'洗淨室')
      if schedule.workpart=='上午'
        @results[:"p1_#{wname}"]=schedule.uid
      elsif schedule.workpart=='下午'
        @results[:"p2_#{wname}"]=schedule.uid
      end
    }
  end


  #write excel. @xieyinghua
  def editrole_writeexcel() 
    # Create a new Excel Worksense
    if Rails.env.production?
      #@wlink='../List.xls'  #tomcat version,
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
    worksheet.write(0, 0, '人員', format)
    @dayscount.times(){|day|
      worksheet.write(0, day+1, "#{day+1}號", format)
    }
    worksheet.write(0, @dayscount+1, '總計', format)
    worksheet.set_column('AG:AG', 70)
    

    #write body
    row=0
    @users.each(){|user|
      row+=1


      worksheet.write(row, 0, user.uname, format)

      @dayscount.times(){|day|
        worksheet.write(row, day+1, @results[:"p1_#{user.uid}_#{day}"])
      }

      
      data=''
      @works.each(){|work|
        if @results[:"#{user.uid}_#{work.wname}"]==nil
          data+=(work.wsort.to_s()+':0 ')
        else
          data+=(work.wsort.to_s()+':'+@results[:"#{user.uid}_#{work.wname}"].to_s()+' ')
        end
      }
      worksheet.write(row, @dayscount+1, data)

      
      row+=1


      @dayscount.times(){|day|
        worksheet.write(row, day+1, @results[:"p2_#{user.uid}_#{day}"])
      }

    }


    #write foot
    row+=1
    worksheet.set_row(35, 180, nil, 0, 1)
    worksheet.write(row, 0, '當日總計', format)
    @dayscount.times(){|day|
      data="上午:\n"
      @works.each(){|work|
        if @results[:"p1_#{day}_#{work.wname}"]==nil
          data+=(work.wsort.to_s()+":0\n")
        else
          data+=(work.wsort.to_s()+':'+@results[:"p1_#{day}_#{work.wname}"].to_s()+"\n")
        end
      }
      data+="下午:\n"
      @works.each(){|work|
        if @results[:"p2_#{day}_#{work.wname}"]==nil
          data+=(work.wsort.to_s()+":0\n")
        else
          data+=(work.wsort.to_s()+':'+@results[:"p2_#{day}_#{work.wname}"].to_s()+"\n")
        end
      }
      worksheet.write(row, day+1, data)
    }


    # write to file
    worksense.close
  end

  # GET /schedules/1/edit
  def editrole
    #初始化相關參數
    @results=Hash.new
    @users=User.all.where("utitle='護理師' and upower!='停用'").order('usort asc')
    @works=Work.all.order("wsort asc")
    @holiday = Holiday.all

    #確定一下要抓的日期是這個月，還是其它有被指定的月份
    @target_date=params[:target_date]
    if @target_date!=nil
      @target_date = DateTime.parse(@target_date)

      if params[:commit]=='下個月'
        @target_date+=1.months
      elsif params[:commit]=='上個月'
        @target_date-=1.months
      end
    else
      @target_date=Date.today
    end
    @d_now=@target_date.strftime("%Y/%m/%d")
    @ym_now=@target_date.strftime("%Y/%m")
    @m_now=@target_date.strftime("%m")
    @dayscount=days_in_month(@m_now.to_i())

    


    #列舉月份的資料
    @schedules=Schedule.all.where("workdate>='#{@ym_now}/01' and workdate<='#{@ym_now}/#{@dayscount}'")
    @schedules.each(){|schedule|
      day=schedule.workdate.strftime("%d").to_i()-1


      #用來給前端顯示每一個人每一天每一節班表的資料
      if schedule.workpart=='上午'

        if schedule.wid!=nil
          work=Work.find_by(:wid=>schedule.wid)
          if work!=nil
            @results[:"p1_#{schedule.uid}_#{day}"]=work.wname
            site_name=@results[:"p1_#{schedule.uid}_#{day}"]  #記錄下來翻譯好的名稱，以給後續的人員統計及日期統計使用
          end
        end


        #用來給前端顯示每一天上午的班表統計
        if @results[:"p1_#{day}_#{site_name}"]==nil
          @results[:"p1_#{day}_#{site_name}"]=1
        else
          @results[:"p1_#{day}_#{site_name}"]+=1
        end

      else

        if schedule.site!=nil
          work=Work.find_by(:wid=>schedule.wid)
          if work!=nil
            @results[:"p2_#{schedule.uid}_#{day}"]=work.wname
            site_name=@results[:"p2_#{schedule.uid}_#{day}"]  #記錄下來翻譯好的名稱，以給後續的人員統計及日期統計使用
          end
        end


        #用來給前端顯示每一天下午的班表統計
        if @results[:"p2_#{day}_#{site_name}"]==nil
          @results[:"p2_#{day}_#{site_name}"]=1
        else
          @results[:"p2_#{day}_#{site_name}"]+=1
        end

      end



      #用來給前端顯示每一個人的班表統計
      if @results[:"#{schedule.uid}_#{site_name}"]==nil
        @results[:"#{schedule.uid}_#{site_name}"]=1
      else
        @results[:"#{schedule.uid}_#{site_name}"]+=1
      end

      #用來給前端顯示每一天的班表統計
      #if @results[:"#{day}_#{site_name}"]==nil
      #  @results[:"#{day}_#{site_name}"]=1
      #else
      #  @results[:"#{day}_#{site_name}"]+=1
      #end
    }




    editrole_writeexcel()
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def updatepage
    #組合params
    @d_now=Date.today.strftime("%Y/%m/%d")
    


    #寫入的資料只處理護理師的
    @users=User.all.where("utitle='護理師'")
    #找出所有的工作
    @works=Work.all.order("wsort asc")



    #寫入這天的上午班表
    @works.each(){|work|
      uid=params[:"p1_#{work.wname}"]
      if @user==nil
        uname=''
      else
        uname=@user[:uname]
      end
=begin
      #原本的，有做格式的轉置
      if(work.wname=='洗淨室一' || work.wname=='洗淨室二')
        wname='洗滌台'
      elsif(work.wname=='消毒室')
        wname='洗滌機'
      else
        wname=work.wname.gsub('一','').gsub('二','').gsub('三','')
      end
=end
      #新的，不做格式的轉置
      if(work.wname=='洗淨室一')
        wname='洗滌台一'
      elsif(work.wname=='洗淨室二')
        wname='洗滌台二'
      elsif(work.wname=='洗淨室三')
        wname='洗滌台三'
      elsif(work.wname=='消毒室')
        wname='洗滌機'
      else
        wname=work.wname
      end
      @result=Schedule.find_by(:workdate=>@d_now, :workpart=>'上午', :site=>wname)
      if @result==nil
        @schedule = Schedule.new(:workdate=>@d_now, :workpart=>'上午', :site=>wname, :uid=>uid, :uname=>uname)
        @schedule.save
      else
        @result.update(:workdate=>@d_now, :workpart=>'上午', :site=>wname, :uid=>uid, :uname=>uname)
      end
    }


    #寫入這天的下午時段
    @works.each(){|work|
      uid=params[:"p2_#{work.wname}"]
      if @user==nil
        uname=''
      else
        uname=@user[:uname]
      end
=begin
      #原本的，有做格式的轉置
      if(work.wname=='洗淨室一' || work.wname=='洗淨室二')
        wname='洗滌台'
      elsif(work.wname=='消毒室')
        wname='洗滌機'
      else
        wname=work.wname.gsub('一','').gsub('二','').gsub('三','')
      end
=end
      #新的，不做格式的轉置
      if(work.wname=='洗淨室一')
        wname='洗滌台一'
      elsif(work.wname=='洗淨室二')
        wname='洗滌台二'
      elsif(work.wname=='洗淨室三')
        wname='洗滌台三'
      elsif(work.wname=='消毒室')
        wname='洗滌機'
      else
        wname=work.wname
      end
      @result=Schedule.find_by(:workdate=>@d_now, :workpart=>'下午', :site=>wname)
      if @result==nil
        @schedule = Schedule.new(:workdate=>@d_now, :workpart=>'下午', :site=>wname, :uid=>uid, :uname=>uname)
        @schedule.save
      else
        @result.update(:workdate=>@d_now, :workpart=>'下午', :site=>wname, :uid=>uid, :uname=>uname)
      end
    }

    

    redirect_to schedule_editpage_path
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def updaterole
    #確定一下要抓的日期是這個月，還是其它有被指定的月份
    @target_date=DateTime.parse(params[:target_date])
    @d_now=@target_date.strftime("%Y/%m/%d")
    @ym_now=@target_date.strftime("%Y/%m")
    @m_now=@target_date.strftime("%m")
    @dayscount=days_in_month(@m_now.to_i())



    #寫入的資料只處理護理師的
    @users=User.all.where("utitle='護理師'")


    #寫入這個月的上午班表
    @users.each(){|user|
      @dayscount.times{|day|
        site=params[:"p1_#{user.uid}_#{day}"]

        if site!=nil
          work=Work.find_by(:wname=>site)
          if work!=nil

=begin
            #原本的，有做格式的轉置
            site=site.gsub(/[一二三]/,'') 
            if site=='消毒室'
              site='洗滌機'
            elsif site=='洗淨室'
              site='洗滌台'
            end
=end
            #新的，不做格式的轉置
            site=site.gsub(/消毒室/,'洗滌機').gsub(/洗淨室/,'洗滌台')

            if day<9
              workdate="#{@ym_now}/0#{day+1}"
            else
              workdate="#{@ym_now}/#{day+1}"
            end

            @result=Schedule.find_by(:workdate=>workdate, :workpart=>'上午', :uid=>user.uid, :uname=>user.uname)
            if @result==nil
              @schedule = Schedule.new(:workdate=>workdate, :workpart=>'上午', :site=>site, :uid=>user.uid, :uname=>user.uname, :wid=>work.wid)
              @schedule.save
            else
              @result.update(:site=>site, :wid=>work.wid)
            end

          end
        end
      }
    }


    #寫入這個月的下午班表
    @users.each(){|user|
      @dayscount.times{|day|
        site=params[:"p2_#{user.uid}_#{day}"]

        if site!=nil
          work=Work.find_by(:wname=>site)
          if work!=nil

=begin
            #原本的，有做格式的轉置
            site=site.gsub(/[一二三]/,'')
            if site=='消毒室'
              site='洗滌機'
            elsif site=='洗淨室'
              site='洗滌台'
            end
=end
            #新的，不做格式的轉置
            site=site.gsub(/消毒室/,'洗滌機').gsub(/洗淨室/,'洗滌台')

            if day<9
              workdate="#{@ym_now}/0#{day+1}"
            else
              workdate="#{@ym_now}/#{day+1}"
            end

            @result=Schedule.find_by(:workdate=>workdate, :workpart=>'下午', :uid=>user.uid, :uname=>user.uname)
            if @result==nil
              @schedule = Schedule.new(:workdate=>workdate, :workpart=>'下午', :site=>site, :uid=>user.uid, :uname=>user.uname, :wid=>work.wid)
              @schedule.save
            else
              @result.update(:site=>site, :wid=>work.wid)
            end

          end
        end
      }
    }

    

    redirect_to schedule_editrole_path(:target_date=>@target_date)
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:workdate, :workpart, :uid, :uname, :site)
    end
end
