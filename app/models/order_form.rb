class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  # バリデーション（入力必須チェック）
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows: 123-4567" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Enter only numbers" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, price: price)
    OrderAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end
