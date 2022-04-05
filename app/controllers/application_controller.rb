class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def autheniticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to ("/login")
    end
  end
  
  def set_current_user
    @current_user = User.find_by(id :session[:user_id])
  end

  def after_sign_up_path_for(resource)
    edit_user_path(resource)        
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
