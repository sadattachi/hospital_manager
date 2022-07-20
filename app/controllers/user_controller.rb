class UserController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def new; end

  def create
    @profile = Profile.new(first_name: params[:first_name],
                           last_name: params[:last_name],
                           doctor_speciality_id: params[:profile][:doctor_speciality_id],
                           avatar: params[:avatar])
    @profile.save
    @user = User.new(phone: params[:phone],
                     password: params[:password],
                     profile_id: @profile.id,
                     role_id: Role.find_by(name: 'Doctor').id)
    if @user.save
      redirect_to admin_users_path
    else
      @profile.destroy
    end
  end
end
