FactoryGirl.define do
  factory(:insurance_provider) do
    association :insurer, factory: :insurer
    association :user, factory: :user
    association :provider, factory: :provider
  end
end
