class ProfileController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def edit
    @profile = User.find(params[:id]).profile
  end

  def update
    @profile = Profile.find(params[:id])
    redirect_to root_path, notice: 'Doctor was successfully updated.' if @profile.update(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(:doctor_speciality_id, :avatar)
  end
end
