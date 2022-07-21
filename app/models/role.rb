class Role < ApplicationRecord
  validates :name, uniqueness: true, inclusion: { in: %w[Patient Doctor] }
  has_many :users
end
