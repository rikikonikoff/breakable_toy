class User < ApplicationRecord
  has_many :appointments
  has_many :providers, through: :appointments

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :zip, numericality: true, length: { is: 5 }, allow_blank: true

  def self.create_with_omniauth(auth)
    create! do |u|
      u.provider = auth.provider
      u.uid = auth.uid
      u.name = auth.info.name
      u.email = auth.info.email
      u.oauth_token = auth.credentials.token
      u.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end
