module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in? 
    !current_user.nil?
  end

  def signed_in_as_admin?
    signed_in? and current_user.admin?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to root_path
    end
  end

  def user_is_admin
    redirect_to(root_path) unless signed_in? and current_user.admin?
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
