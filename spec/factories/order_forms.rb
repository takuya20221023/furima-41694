FactoryBot.define do
  factory :order_form do
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
    price { 1000 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市' }
    address { '1-1' }
    building { 'ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
