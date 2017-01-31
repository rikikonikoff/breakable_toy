class Provider < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :zip, numericality: true, length: { is: 5 }, allow_blank: true

  def self.create_with_omniauth(auth)
    create! do |p|
      p.provider = auth.provider
      p.uid = auth.uid
      p.name = auth.info.name
      p.email = auth.info.email
      p.oauth_token = auth.credentials.token
      p.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end
