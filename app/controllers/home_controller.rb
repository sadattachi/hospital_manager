class HomeController < ApplicationController
  def index
    @doctors = User.select(&:doctor?)
    @patients = User.select(&:patient?)
    @current_select = nil
  end

  def filter
    @current_select = params[:profile][:doctor_speciality_id].to_i
    @doctors = User.select(&:doctor?).select do |u|
      u.profile.doctor_speciality.id == @current_select
    end

    render template: 'home/_doctors', doctors: @doctors, current_select: @current_select
  end
end
