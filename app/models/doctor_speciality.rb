class DoctorSpeciality < ApplicationRecord
  validates :name, uniqueness: true
  has_many :profiles
end
