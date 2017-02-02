FactoryGirl.define do
  factory :provider do
    sequence(:name) { |n| "Provider #{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    sequence(:uid) { |n| }
  end
end
