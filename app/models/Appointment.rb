class Appointment < ApplicationRecord
  belongs_to :provider
  belongs_to :user, optional: true

  validates :provider_id, presence: true
  validates :booked?, inclusion: { in: [ true, false ] }
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def book!(user)
    update_attribute(:user, user)
    update_attribute(:booked?, true)
  end

  def unbook!
    update_attribute(:user, nil)
    update_attribute(:booked?, false)
  end
end
