ActiveAdmin.register User do
  controller do
    def new
      render template: 'user/new', layout: 'active_admin'
    end

    def create
      @profile = Profile.new(first_name: params[:first_name],
                             last_name: params[:last_name],
                             doctor_speciality_id: params[:profile][:doctor_speciality_id],
                             avatar: params[:avatar])
      authorize! :create, @profile
      @profile.save
      @user = User.new(phone: params[:phone],
                       password: params[:password],
                       profile_id: @profile.id,
                       role_id: Role.find_by(name: 'Doctor').id)
      authorize! :create, @user
      if @user.save
        redirect_to admin_users_path
      else
        redirect_to request.referer, alert: @user.errors.full_messages
        @profile.destroy
      end
    end

    def edit
      @profile = User.find(params[:id]).profile
      render template: 'profile/edit', layout: 'active_admin'
    end

    def update
      @profile = User.find(params[:id]).profile
      authorize! :update, @profile
      if @profile.update(doctor_speciality_id: params[:profile][:doctor_speciality_id].to_i,
                         avatar: params[:profile][:avatar])
        redirect_to admin_users_path, notice: 'Doctor was successfully updated!'
      end
    end
  end

  index do
    selectable_column
    column 'Picture' do |user|
      cl_image_tag user.profile.avatar.key, width: 100, height: 100, crop: 'fill'
    end
    column 'Full Name' do |user|
      user.profile.first_name + ' ' + user.profile.last_name
    end
    column 'Doctor Speciality' do |user|
      if user.profile.doctor_speciality.nil?
        '-'
      else
        user.profile.doctor_speciality
      end
    end
    column :phone
    actions defaults: false do |user|
      item 'Edit', edit_admin_user_path(user), class: 'member_link' unless user.profile.doctor_speciality.nil?
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :phone, :encrypted_password, :profile_id, :role_id, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:phone, :encrypted_password, :profile_id, :role_id, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
