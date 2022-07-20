ActiveAdmin.register User do
  controller do
    def new
      render template: 'user/new', layout: 'active_admin'
    end

    def edit
      @profile = User.find(params[:id]).profile
      render template: 'profile/edit', layout: 'active_admin'
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
        'Patient'
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
