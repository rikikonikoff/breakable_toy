class Provider < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :work_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, numericality: true, length: { is: 5 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.oauth_refresh_token = auth.credentials.refresh_token if auth.credentials.refresh_token
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
