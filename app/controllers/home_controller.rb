class HomeController < ApplicationController
  def index
    @doctors = User.where('role_id = :doctor', doctor: 2)
    @current_select = nil
  end

  def filter
    @current_select = params[:profile][:doctor_speciality_id].to_i
    @doctors = User.where('role_id = :doctor', doctor: 2).select do |u|
      u.profile.doctor_speciality.id == @current_select
    end

    render :index
  end
end
