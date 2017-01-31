class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :insurance_provider, :address, :city, :state, :zip

  has_many :appointments
  has_many :providers, through: :appointments
end
