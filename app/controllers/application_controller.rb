class ApplicationController < ActionController::Base
  protect_from_forgery
  def login_required
    if !current_user
      respond_to do |format|
        format.html  {
          redirect_to ("#{PROVIDER_URL}/auth/autentificare/authorize", redirect_uri: "http://fmi-burse.herokuapp.com/user_new_session")
        }
        format.json {
          render :json => { 'error' => 'Access Denied' }.to_json
        }
      end
    end
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find_by_uid(session[:user_id]['uid'])
  end
end
