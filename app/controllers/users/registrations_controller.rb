# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :verify_authenticity_token

  skip_before_action :check_user, except: [:new, :create]

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # after_action


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end
  # def create
  #   super
  #   # User.create!(:email => 'someone@something.com', :password => password, :password_confirmation => password)
  # end
  #
  def create
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    generated_password = "123456"
    s_hash = sign_up_params.to_hash()
    s_hash["password"] = generated_password
    s_hash["progression"] = 0
    puts(s_hash)
    sign_up_params = ActionController::Parameters.new(s_hash).permit(:username, :password, :progression)
    # print('sign_up_params.type: ', sign_up_params.class)
    # print('s_hash: ', s_hash)
    # print('sign_up_params[:password]: ', sign_up_params["password"])
    #
    # print('sign_up_params: ', sign_up_params)

    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  #
  private

  def sign_up_params
    params.require(:user).permit(:username, :password, :progression)
  end

  def account_update_params
    params.require(:user).permit(:username, :password, :progression, :current_password)
  end
  # User.find_for_database_authentication



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
