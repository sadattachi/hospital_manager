ActiveAdmin.register User do
  controller do
    def new
      render template: 'user/new', layout: 'active_admin'
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
