class User < ApplicationRecord
  # Deviseモジュール
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :items, dependent: :destroy

  # バリデーション
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
  end

  # パスワードのバリデーション
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字を含めてください（記号・全角文字は使用不可）' },
                       length: { minimum: 8 }

  # 年齢制限（18歳以上）
  validates :birth_date, comparison: { less_than_or_equal_to: 18.years.ago, message: 'は18歳以上でなければなりません' }
end
