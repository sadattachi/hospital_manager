class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @appointments = current_user.doctor_appointments
  end
end
