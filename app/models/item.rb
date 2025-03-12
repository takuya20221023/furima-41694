class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Deviseモジュール
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable

  validates :nickname, presence: true, length: { maximum: 20, message: 'は20文字以内で入力してください' }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true

  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
  
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字を含めてください（記号・全角文字は使用不可）' }
  validates :password, length: { minimum: 8, message: 'は8文字以上で入力してください' }
  
  # 生年月日について未来の日付や年齢制限を加えたい場合
  validates :birth_date, comparison: { less_than_or_equal_to: Date.today, message: "は未来の日付を選択できません" }
  validates :birth_date, comparison: { greater_than_or_equal_to: 18.years.ago, message: "は18歳以上でなければなりません" }
end
