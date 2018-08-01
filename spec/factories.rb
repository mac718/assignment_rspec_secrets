FactoryGirl.define do

  factory :user do 
    name: "Steve"
    email: 'steve@bar.com'
  end

  factory :secret do 
    title: "Some Secret"
    body: "Body of the secret"
    author: :user
  end
end