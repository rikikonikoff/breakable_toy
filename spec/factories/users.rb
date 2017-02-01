FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "testemail#{n}@example.com" }
    sequence(:uid) { |n| }
    sequence(:oauth_token) { |n| }
    oauth_expires_at 1234567
  end
end
