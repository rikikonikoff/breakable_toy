class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date, :start_time, :end_time, :provider_id, :user_id
end
