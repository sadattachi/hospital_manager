class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  belongs_to :role
  belongs_to :profile

  has_many :doctor_appointments, foreign_key: :patient_id, class_name: 'Appointment'
  has_many :doctors, through: :doctor_appointments

  has_many :patient_appointments, foreign_key: :doctor_id, class_name: 'Appointment'
  has_many :patients, through: :patient_appointments

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
