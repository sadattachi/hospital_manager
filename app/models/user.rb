class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  belongs_to :role
  belongs_to :profile

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def admin?
    role.name == 'Admin'
  end

  def doctor?
    role.name == 'Doctor'
  end

  def patient?
    role.name == 'Patient'
  end
end
