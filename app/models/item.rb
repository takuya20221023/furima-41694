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
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300以上9999999以下で入力してください' }
  validates :condition_id, presence: { message: 'は必須です' }
  validates :category_id, presence: { message: 'は必須です' }
  validates :shipping_fee_id, presence: { message: 'は必須です' }
  validates :prefecture_id, presence: { message: 'は必須です' }
  validates :shipping_day_id, presence: { message: 'は必須です' }

  # 商品画像
  has_one_attached :image
  validates :image, presence: true

  # 販売手数料の計算
  def sale_fee
    return 0 if price.nil? || price <= 0
    (price * 0.1).floor
  end

  # 販売利益の計算
  def profit
    return 0 if price.nil? || price <= 0
    (price - sale_fee).floor
  end
end

