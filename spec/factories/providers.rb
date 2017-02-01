FactoryGirl.define do
  factory :provider do
    sequence(:name) { |n| "Provider #{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    sequence(:uid) { |n| }
    sequence(:oauth_token) { |n| }
    oauth_expires_at 1234567
  end
end
