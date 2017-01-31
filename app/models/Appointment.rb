class Appointment < ApplicationRecord
  belongs_to :provider
  belongs_to :user, optional: true

  validates :provider_id, presence: true
  validates :booked?, presence: true, inclusion: { in: [ true, false ] }
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def book!
    update_attribute(:user, current_user)
  end

  def unbook!
    update_attribute(:user, nil)
  end
end
