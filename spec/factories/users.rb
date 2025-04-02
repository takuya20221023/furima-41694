require 'faker'

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" } # ユニークなメールアドレスを生成
    password { Faker::Internet.password(min_length: 8) } # ランダムなパスワード
    password_confirmation { password } # passwordと一致させる
    nickname { Faker::Name.name } # ランダムな名前
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 80) } # 18〜80歳のランダムな誕生日
  end
end
