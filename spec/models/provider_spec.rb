require 'rails_helper'

RSpec.describe Provider, type: :model do
  let!(:provider) { FactoryGirl.create(:provider) }

  describe ".new" do
    it "has a name" do
      expect(provider.name).to_not eq nil
    end

    it "has a valid email address" do
      expect(provider.email).to_not eq nil
      expect(provider.email.include?("@")).to be true
    end
  end
end
