class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 # Deviseモジュール
 devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

 # バリデーション
 validates :nickname, presence: true
 validates :email, presence: true, uniqueness: true
 validates :password, presence: true, length: { minimum: 6 }
 validates :password_confirmation, presence: true, if: :password_changed?

 private

 def password_changed?
   # パスワードが変更されているかどうかの条件
   password.present?
 end
end