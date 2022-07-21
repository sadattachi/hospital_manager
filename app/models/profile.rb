class Profile < ApplicationRecord
  has_one :user
  belongs_to :doctor_speciality
  has_one_attached :avatar
end
