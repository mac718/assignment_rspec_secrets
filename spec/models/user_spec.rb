require 'rails_helper'
describe User do 
  let(:user){ build (:user) }

  it "is valid with default attributes" do 
    expect(user).to be_valid
  end

  it "saves with default attributes" do 
    expect{ user.save! }.not_to raise_error
  end
end