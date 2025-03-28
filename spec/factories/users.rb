require 'faker'

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" } # 修正: ユニークなメールを確実に生成
    password { 'password123' }
    password_confirmation { 'password123' }
    nickname { 'testuser' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '1990-01-01' }
  end
end
