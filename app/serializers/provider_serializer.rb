class ProviderSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :bio,
    :profile,
    :email,
    :work_address,
    :city,
    :state,
    :zip,
    :avatar

  has_many :appointments
  has_many :users, through: :appointments

  has_many :insurance_providers
  has_many :insurers, through: :insurance_providers
end
