class ApplicationController < ActionController::Base
  after_action :release_connection


  #global variant
  @@dbhost = '192.168.0.200'
  @@dbid = 'mfr'
  @@dbpw = 'mfr168'
  @@dbsid = 'DICOMDB'


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session #protect_from_forgery setting to null_session for foreign API(like gem Rest_Client) call RESTful can skip session problem. @xieyinghua

  # include SessionSHelper function for all app. @xieyinghua
  include SessionsHelper


  def get_customer()
    # set cumstomer name. CCH or SC. @xieyinghua
    #'CCH'
    'SC'
  end


  def time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end
  

  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  def days_in_month(month, year = Time.now.year)
     return 29 if month == 2 && Date.gregorian_leap?(year)
     COMMON_YEAR_DAYS_IN_MONTH[month]
  end
  
  def release_connection
    ActiveRecord::Base.connection_pool.release_connection
  end
end
