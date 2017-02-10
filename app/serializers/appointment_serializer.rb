class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,
    :date,
    :start_time,
    :end_time,
    :booked?

  belongs_to :provider
  belongs_to :user
end
