module SessionsHelper
  # for sign in assign user, global session will written assign user's session_token. @xieyinghua
	def sign_in(user)
    session[:session_token] = user.session_token
  end

  # for check currect user is nil or not. @xieyinghua
	def signed_in?
  	!current_user.nil?
	end
	
  # assign currect user be a user where the session_token equals global session. @xieyinghua
	def current_user
  	@current_user ||= User.find_by_session_token(session[:session_token])
	end

  # set currect user be a user where assign user. @xieyinghua
	def current_user?(user)
  	current_user == user
	end

  # set currect user be nil and delete global session. @xieyinghua
  def sign_out
    @current_user = nil
    session.delete(:session_token)
  end
end
