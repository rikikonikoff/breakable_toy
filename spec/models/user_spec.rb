require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryGirl.create(:user) }

  describe ".new" do
    it "has a name" do
      expect(user.name).to_not eq nil
    end

    it "has a valid email address" do
      expect(user.email).to_not eq nil
      expect(user.email.include?("@")).to be true
    end
  end
end
