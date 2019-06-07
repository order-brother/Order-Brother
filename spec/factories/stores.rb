FactoryBot.define do
  factory :store do
    name { "MyString" }
    description { "MyText" }
    location { "MyString" }
    latitude { "MyString" }
    tel { "MyString" }
    user { nil }
  end
end
