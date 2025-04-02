require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)  # ユーザーを作成
    item = FactoryBot.create(:item)  # 商品を作成
    @order = FactoryBot.build(:order, user: user, item: item) # 関連付け
  end

  context '内容に問題ない場合' do
    it 'priceがあれば保存ができること' do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'priceが空では保存ができないこと' do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Price can't be blank")
    end
  end
end
