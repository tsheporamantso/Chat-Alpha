require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes should be present" do
    context "username should be present, unique, case sensitive and minimum and maximum length of characters should be between 3 and 25" do
      it "should not be valid without username" do
        user = FactoryBot.build(:user, username: nil)
        expect(user).to_not be_valid
      end
      it "should not allow duplicate username, even with case variations" do
        FactoryBot.create(:user)
  
        duplicate_user = FactoryBot.build(:user, username: "TSHEPO")
        expect(duplicate_user).to_not be_valid
      end
      it "should not be valid with less than 3 characters" do
        user = FactoryBot.build(:user, username: "aa")
        expect(user).to_not be_valid
      end
      it "should not be valid with more than 25 characters" do
        user = FactoryBot.build(:user, username: "a" * 26)
        expect(user).to_not be_valid
      end
    end
    context "email attribute should be present, unique & case sensitive with maximum length of not more than 105 characters and have correct email format" do
      it "should not be valid without email" do
        user = FactoryBot.build(:user, email: nil)
        expect(user).to_not be_valid
      end

      it "should not allow duplicate email, even with case variations" do
        FactoryBot.create(:user)

        duplicate_user = FactoryBot.build(:user, email: "TSHEPO.RAMANTSO@GMAIL.COM")
        expect(duplicate_user).to_not be_valid
      end

      it "should not be valid with incorrect email address format" do
        FactoryBot.create(:user)

        email = FactoryBot.build(:user, email: "@example.com")
        expect(email).to_not be_valid
      end

      it "should not be too long" do
        email = FactoryBot.build(:user, email: "aa@example.com" * 106)
        expect(email).to_not be_valid
      end
    end
  end
end
