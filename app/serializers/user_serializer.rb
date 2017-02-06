class UserSerializer < ActiveModel::Serializer
  attributes :id,
  :name,
  :email,
  :address,
  :city,
  :state,
  :zip

  has_many :appointments
  has_many :providers, through: :appointments

  has_many :insurance_providers
  has_many :insurers, through: :insurance_providers
end
