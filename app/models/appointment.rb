class Appointment < ApplicationRecord
  validates :status, inclusion: { in: %w[Closed Active] }

  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'
end
