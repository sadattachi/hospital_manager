class DoctorSpecialitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index; end

  def new; end

  def create
    @doctor_speciality = DoctorSpeciality.new(speciality_params)
    if @doctor_speciality.save
      redirect_to root_path, notice: 'Speciality was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def speciality_params
    params.require(:doctor_speciality).permit(:name)
  end
end
