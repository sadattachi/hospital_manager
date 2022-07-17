class UserController < ApplicationController
    def new
    end

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
        @user.save
    end
end