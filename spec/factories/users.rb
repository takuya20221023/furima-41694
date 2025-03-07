FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    nickname { 'testuser' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '1990-01-01' }
  end
end