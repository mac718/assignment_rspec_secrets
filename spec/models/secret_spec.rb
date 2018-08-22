require 'rails_helper'
describe Secret do 
  let(:secret){ build(:secret) }
  let(:user){ build(:user) }

  it "is valid with default attributes" do 
    expect(secret).to be_valid
  end

  it "saves with default attributes" do 
    expect{ secret.save! }.not_to raise_error
  end

  it "is not valid if title is blank" do 
    secret = build(:secret, :title => '')
    expect(secret).not_to be_valid
  end

  it "is not valid if body is blank" do 
    secret = build(:secret, :body => '')
    expect(secret).not_to be_valid
  end

  it "is not valid if title is fewer than 4 characters long" do 
    secret = build(:secret, :title => 'aaa')
    expect(secret).not_to be_valid
  end

  it "is not valid if title is more than 24 characters long" do 
    secret = build(:secret, :title => 'a' * 25)
    expect(secret).not_to be_valid
  end

  it "is not valid if body is fewer than 4 characters long" do 
    secret = build(:secret, :body => 'aaa')
    expect(secret).not_to be_valid
  end

  it "is not valid if title is more than 140 characters long" do 
    secret = build(:secret, :body => 'a' * 141)
    expect(secret).not_to be_valid
  end

  it "responds to author association" do
    expect(secret).to respond_to(:author) 
  end

  describe ".last_five" do 
    it "returns five records" do 
      create_list(:secret, 10, :author => user)
      secret_count = Secret.last_five.length
      expect(secret_count).to equal(5)
    end
  end

end