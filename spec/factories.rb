FactoryBot.define do

  factory :user, :aliases => [:author] do 
    name { "Steve" }
    email { 'steve@bar.com' }
    password {'password'}
  end

  factory :secret do 
    title { "Some Secret" }
    body { "Body of the secret" }
    author
  end
end