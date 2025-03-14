require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }

  # バリデーションテスト
  context 'バリデーションのテスト' do
    it '商品名がないと保存できないこと' do
      item = Item.new(user: user, description: 'Test description', price: 1000)
      expect(item).not_to be_valid
    end

    it '商品説明がないと保存できないこと' do
      item = Item.new(user: user, name: 'Test Item', price: 1000)
      expect(item).not_to be_valid
    end

    it '価格がないと保存できないこと' do
      item = Item.new(user: user, name: 'Test Item', description: 'Test description')
      expect(item).not_to be_valid
    end

    it '価格が300円未満だと保存できないこと' do
      item = Item.new(user: user, name: 'Test Item', description: 'Test description', price: 200)
      expect(item).not_to be_valid
    end

    it '価格が9999999円以上だと保存できないこと' do
      item = Item.new(user: user, name: 'Test Item', description: 'Test description', price: 10_000_000)
      expect(item).not_to be_valid
    end

    it '価格が半角数字以外だと保存できないこと' do
      item = Item.new(user: user, name: 'Test Item', description: 'Test description', price: 'abc')
      expect(item).not_to be_valid
    end

    it '全ての条件が整っていると保存できること' do
      item = Item.new(user: user, name: 'Test Item', description: 'Test description', price: 1000, category_id: 1,
                      condition_id: 1, shipping_fee_id: 1, prefecture_id: 1, shipping_day_id: 1)
      expect(item).to be_valid
    end
  end

  # 販売手数料と販売利益の計算
  context '計算ロジックのテスト' do
    let(:item) { create(:item, user: user, price: 1000) }

    it '販売手数料が価格の10%で計算されること' do
      expected_fee = (item.price * 0.1).floor
      expect(item.sale_fee).to eq(expected_fee)
    end

    it '販売利益が価格から販売手数料を引いた金額で計算されること' do
      expected_profit = (item.price - item.sale_fee).floor
      expect(item.profit).to eq(expected_profit)
    end
  end
end
