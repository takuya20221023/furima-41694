class Item < ApplicationRecord
  # ActiveHash associations
  extend ActiveHash::Associations::ActiveRecordExtensions

  # モデル間の関連付け
  belongs_to :user
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  # バリデーション
  validates :name, presence: { message: 'は必須です' }
  validates :description, presence: { message: 'は必須です' }
  validates :price, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'は300以上9999999以下の整数で入力してください' }

  # ActiveHashのバリデーション（'---'が選択されないようにする）
  validates :condition_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :shipping_fee_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :shipping_day_id, numericality: { other_than: 1, message: 'を選択してください' }

  # 商品画像
  has_one_attached :image
  validates :image, presence: true

  # 売却済みかどうかを判定するメソッド
  # def sold_out?
  #   self.order.present? # 注文が存在する場合、売却済み
  # end
end
