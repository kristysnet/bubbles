class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    # @current_user ||= session[:user_id] && ::User.find(session[:user_id])
    # TODO install login
    @current_user = User.first
  end
  helper_method :current_user


  helper_method def goal_week
    "#{Time.now.year}.#{Time.now.strftime('%W')}"
  end

end
