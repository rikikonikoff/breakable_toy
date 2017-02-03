class Provider < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :email, presence: true
  validates :zip, numericality: true, length: { is: 5 }, allow_blank: true
  validates_email_format_of :email

  def self.create_with_omniauth(auth)
    create! do |p|
      p.provider = auth.provider
      p.uid = auth.uid
      p.name = auth.info.name
      p.email = auth.info.email
    end
  end
end
