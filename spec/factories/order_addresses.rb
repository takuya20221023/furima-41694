FactoryBot.define do
  factory :order_address do
    postal_code      { '123-4567' }
    prefecture_id    { 2 }
    city            { '東京都' }
    house_number    { '1-1' }
    building_name   { '東京ハイツ' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' } # ダミーのトークン

    # 外部キー（アソシエーションが必要なら定義）
    association :user
    association :item
  end
end
