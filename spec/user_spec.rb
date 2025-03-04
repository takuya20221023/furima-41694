require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",  # 追加: password_confirmationを指定
      nickname: "testuser",
      last_name: "山田" ,
      first_name: "太郎" ,
      last_name_kana: "ヤマダ" ,
      first_name_kana: "タロウ" ,
      birth_date: "1990-01-01" ,
    )
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(password: "password", password_confirmation: "password")
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = User.new(email: "test@example.com")
    expect(user).not_to be_valid
  end

  it "is invalid if password and password_confirmation do not match" do
    user = User.new(
      email: "test@example.com",
      password: "password",
      password_confirmation: "differentpassword"
    )
    expect(user).not_to be_valid
  end

  it "is invalid without a nickname" do
    user = User.new(nickname: "testuser")
    expect(user).not_to be_valid
  end

  it "is invalid without a last_name " do
    user = User.new(last_name: "山田")
    expect(user).not_to be_valid
  end
  it "is invalid without a first_name " do
    user = User.new(first_name: "太郎")
    expect(user).not_to be_valid
  end
  it "is invalid without a last_name_kana" do
    user = User.new(last_name_kana: "ヤマダ")
    expect(user).not_to be_valid
  end
  it "is invalid without a first_name_kana" do
    user = User.new(first_name_kana: "タロウ")
    expect(user).not_to be_valid
  end
  it "is invalid without a birth_date" do
    user = User.new(birth_date: "1990-01-01")
    expect(user).not_to be_valid
  end

  
end
