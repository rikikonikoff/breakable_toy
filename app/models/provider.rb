class Provider < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :appointments
  has_many :users, through: :appointments
  has_many :insurance_providers
  has_many :insurers, through: :insurance_providers

  validates :name, presence: true
  validates :email, presence: true
  validates :zip, numericality: true, length: { is: 5 }, allow_blank: true
  validates_email_format_of :email

  def self.create_with_omniauth(auth)
    create! do |record|
      record.provider = auth.provider
      record.uid = auth.uid
      record.name = auth.info.name
      record.email = auth.info.email
      record.avatar = auth.info.image
    end
  end
end
