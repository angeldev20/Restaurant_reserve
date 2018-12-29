class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    update_attrs = [:name, :phone, :email, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit(:account_update, keys: [update_attrs])
    
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def admin_owner_only
    unless current_user.admin? or current_user.owner?
      redirect_to root_path, :alert => "Access denied."
    end
  end


  # Will come back to this, don't like js in controller
  # def js_redirect_to(path)
  #   render js: %(window.location.pathname = '#{path}) and return
  # end

end
