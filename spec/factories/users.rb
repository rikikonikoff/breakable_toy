FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "testemail#{n}@example.com" }
    sequence(:uid) { |n| }
  end
end
