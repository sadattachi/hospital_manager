class HomeController < ApplicationController
  def index
    @doctors = User.where('role_id = :doctor', doctor: 2)
  end
end
