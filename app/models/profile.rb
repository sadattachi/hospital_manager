class Profile < ApplicationRecord
  belongs_to :doctor_speciality
  has_one_attached :avatar
end
