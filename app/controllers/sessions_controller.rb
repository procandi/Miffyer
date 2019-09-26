class SessionsController < ApplicationController
  def new
  end

  def create
    @user=User.find_by(:uid=>params[:session][:uid])

    if @user && @user.upw==params[:session][:upw]
      sign_in(@user)  #written session token. @xieyinghua

      flash[:success]="Welcome back, #{@user.uname}"  #alarm message for show login successful. @xieyinghua
      redirect_to @user
    else
      #redirect_to new_session_path, notice: 'Invalid id/password combination'
      flash[:error]="Invalid id/password combination" #alarm message for show login faild. @xieyinghua
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
