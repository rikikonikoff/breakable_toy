class Provider < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :work_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, numericality: true, length: { is: 5 }

  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |doc|
      doc.provider = provider
      doc.uid = uid
      doc.email = auth.info.email
      doc.username = auth.info.name
      doc.oauth_token = auth.credentials.token
      doc.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end
