class Insurer < ApplicationRecord
  has_many :insurance_providers
  has_many :users, through: :insurance_providers
  has_many :providers, through: :insurance_providers

  validates :company, presence: true
  validates :plan, presence: true
  validates_uniqueness_of :company, scope: [:plan]
end
