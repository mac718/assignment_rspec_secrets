require 'rails_helper'
FactoryGirl.define do 
  let(:secret){ build(:secret) }

  it "is valid with default attributes" do 
    expect(secret).to be_valid
  end

  it "saves with default attributes" do 
    expect{ secret.save! }.not_to raise_error
  end
end