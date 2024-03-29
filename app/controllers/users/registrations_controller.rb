# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    if params[:password] != params[:password_confirmation]
      redirect_to new_user_registration_path, alert: 'Password and password confirmation field have different values'
      return
    end
    @profile = Profile.new(first_name: params[:first_name],
                           last_name: params[:last_name])
    @profile.save
    @user = User.new(phone: params[:phone],
                     password: params[:password],
                     profile_id: @profile.id,
                     role_id: Role.find_by(name: 'Patient').id)
    if @user.save
      redirect_to new_user_session_path, notice: 'Account was successfully created!'
    else
      redirect_to new_user_registration_path, alert: @user.errors.full_messages
      @profile.destroy
    end
  end

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
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone first_name last_name password])
  end

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
