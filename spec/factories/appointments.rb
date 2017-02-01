FactoryGirl.define do
  factory :appointment do
    association :provider, factory: :provider
    association :user, factory: :user
    booked? true
    date Date.today
    start_time "11:00"
    end_time "12:00"
  end
end
