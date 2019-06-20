FactoryBot.define do
  factory :dish do
    name { "MyString" }
    price { "9.99" }
    prepare_time { "2019-06-06 00:22:28" }
    state { 1 }
    store { FactoryBot.create(:store, :super_store) }
  end
end
