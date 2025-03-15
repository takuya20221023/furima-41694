FactoryBot.define do
  factory :item do
    name { "Test Item" }
    description { "Test description" }
    price { 1000 }
    category_id { 1 }
    condition_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    shipping_day_id { 1 }
    user


    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
