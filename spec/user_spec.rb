require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",  # 追加: password_confirmationを指定
      nickname: "testuser"
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
end