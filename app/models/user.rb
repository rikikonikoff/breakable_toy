class User < ApplicationRecord
  has_many :appointments
  has_many :providers, through: :appointments

  validates :name, presence: true
  validates :email, presence: true
  validates :zip, numericality: true, length: { is: 5 }, allow_blank: true
  validates_email_format_of :email

  def self.create_with_omniauth(auth)
    create! do |u|
      u.provider = auth.provider
      u.uid = auth.uid
      u.name = auth.info.name
      u.email = auth.info.email
    end
  end
end
