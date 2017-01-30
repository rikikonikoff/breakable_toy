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
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |provider|
      provider.provider = auth.provider
      provider.uid = auth.uid
      provider.username = auth.info.username
      provider.oauth_token = auth.credentials.token
      provider.oauth_expires_at = Time.at(auth.credentials.expires_at)
      provider.save!
    end
  end
end
