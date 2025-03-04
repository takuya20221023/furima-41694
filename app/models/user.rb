class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 # Deviseモジュール
 devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

 validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true
  
 private

 def password_changed?
   # パスワードが変更されているかどうかの条件
   password.present?
 end
end