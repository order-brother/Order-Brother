FactoryBot.define do
  factory :user do
    title { "MyString" }
    name { Faker::Name.unique.name }
    password { "999999" }
    phone { Faker::Number.number(10) }
    email { Faker::Internet.email }
    role { "admin" }
    favorite_store { "" }
  end
end
