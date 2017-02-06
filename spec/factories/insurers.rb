FactoryGirl.define do
  factory :insurer do
    sequence(:company) { |n| "Insurer #{n}" }
    sequence(:plan) { |n| "Plan type #{n}" }
  end
end
