# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  def create
    respond_to do |format|  
      format.html { super }  
      format.json {  
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")  
        render :json => {:success => true}  
      }
    end  
  end

  def destroy
    respond_to do |format|
      format.html {super}
      format.json {  
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        render :json => {}
      }
    end
  end

  def failure
    render :json => {:success => false, :errors => ["Login Failed"]}
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
