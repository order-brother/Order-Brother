FactoryBot.define do
  factory :user do
    title { "MyString" }
    name { Faker::FunnyName.two_word_name}
    password { "999999" }
    phone { Faker::Number.number(10) }
    email { Faker::Internet.email }
    role { "admin" }
    favorite_store { "" }
  end
end
