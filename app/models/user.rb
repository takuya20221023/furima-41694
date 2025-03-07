class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Deviseモジュール
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true

 validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
 validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
 validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください" }
 validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください" }
end





end




