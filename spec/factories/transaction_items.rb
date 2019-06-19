FactoryBot.define do
  factory :transaction_item do
    dish { nil }
    dish_count { 1 }
    item_price { "10.0" }
    transacttion_record { nil }
  end
end
