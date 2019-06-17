# FIXME 無法創建資料
FactoryBot.define do
  factory :transaction do
    total_price { "9.99" }
    description { "MyText" }
    pick_up_time { "MyString" }
    state { 1 }
    # user { FactoryBot.create(:user) }
    user { User.first }
    # store { FactoryBot.create(:store) }
    store { Store.first }
    like { false }
    read_at { "2019-06-06 00:08:33" }
  end
end
