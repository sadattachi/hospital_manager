class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @appointments = if current_user.patient?
                      current_user.doctor_appointments
                    else
                      current_user.patient_appointments
                    end
  end

  def create
    @appointment = Appointment.new(patient_id: current_user.id,
                                   doctor_id: params[:id].to_i,
                                   status: 'Active')
    if @appointment.save && User.find_by(id: params[:id].to_i).patient_appointments.count <= 10
      redirect_to appointments_path, notice: 'Appointment was added'
    else
      redirect_to root, notice: 'Cannot add appointment'
    end
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])

    if @appointment.update(status: 'Closed', recommendations: params[:recommendations])
      redirect_to appointments_path, notice: 'Recommendation was added'
    else
      redirect_to appointments_path, notice: 'Recommendation cannot be added'
    end
  end
end
