class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,
    :date,
    :start_time,
    :end_time,
    :user_id

  belongs_to :provider
end
