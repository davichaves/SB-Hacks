module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
		user.check_last_login_date if user.last_login
		user.update_attribute(:last_login, DateTime.now)
	end

	  # Returns the current logged-in user (if any).
	  def current_user
	  	@current_user ||= User.find_by(id: session[:user_id])
	  end

	  def logged_in?
	  	!current_user.nil?
	  end

	  def log_out
	  	session.delete(:user_id)
	  	@current_user = nil
	  end


	  def current_user?(user)
	  	user == current_user
	  end
	end
