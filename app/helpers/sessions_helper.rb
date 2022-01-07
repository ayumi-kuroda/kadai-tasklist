module SessionsHelper
  #現在ログインしているユーザを求める
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
