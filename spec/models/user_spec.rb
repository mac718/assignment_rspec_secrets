require 'rails_helper'
describe User do 
  let(:user){ build (:user) }

  describe 'basic validity' do 
    it "is valid with default attributes" do 
      expect(user).to be_valid
    end

    it "saves with default attributes" do 
      expect{ user.save! }.not_to raise_error
    end
  end

  describe 'validations' do
    it "is not valid if email is not present" do
      user = build(:user, :email => '') 
      expect(user).not_to be_valid
    end

    it "is not valid if name is fewer than 3 characters" do 
      user = build(:user, :name => 'aa') 
      expect(user).not_to be_valid
    end

    it "is not valid if name is more than 20 characters" do 
      user = build(:user, :name => 'a' * 21) 
      expect(user).not_to be_valid
    end

    it "is not valid if email is not unique" do 
      user1 = create(:user)
      user2 = build(:user)
      expect(user2).not_to be_valid
    end

    it "is not valid if password is fewer than 6 characters" do 
      user = build(:user, :password => 'aaer') 
      expect(user).not_to be_valid
    end

    it "is not valid if password is more than 16 characters" do 
      user = build(:user, :password => 'a' * 17) 
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it "responds to secrets association" do
      expect(user).to respond_to(:secrets) 
    end
  end
end