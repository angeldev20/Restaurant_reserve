class RegistrationsController < Devise::RegistrationsController
    
protected

      def update_resource(resource, params)
        if params[:password]
          resource.password = params[:password]
          resource.password_confirmation = params[:password_confirmation]
        end
        resource.update_without_password(params)
      end

      def after_update_path_for(resource)
        edit_registration_path(resource)
      end

end