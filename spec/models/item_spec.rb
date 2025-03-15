require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }

  # バリデーションテスト
  context 'バリデーションのテスト' do
    before do
      # バリデーションテスト用のインスタンスをFactoryBotで生成
      @item = FactoryBot.build(:item, user: user)
    end

    context '異常系' do
      it '商品名がないと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明がないと保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '価格がないと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満だと保存できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300以上9999999以下で入力してください")
      end

      it '価格が9999999円以上だと保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300以上9999999以下で入力してください")
      end

      it '価格が半角数字以外だと保存できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'category_idが-1だと保存できないこと' do
        @item.category_id = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category は必須です")
      end

      it 'condition_idが-1だと保存できないこと' do
        @item.condition_id = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition は必須です")
      end

      it 'shipping_fee_idが-1だと保存できないこと' do
        @item.shipping_fee_id = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee は必須です")
      end

      it 'prefecture_idが-1だと保存できないこと' do
        @item.prefecture_id = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture は必須です")
      end

      it 'shipping_day_idが-1だと保存できないこと' do
        @item.shipping_day_id = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day は必須です")
      end
    end

    context '正常系' do
      it '全ての条件が整っていると保存できること' do
        @item.price = 1000
        @item.category_id = 1
        @item.condition_id = 1
        @item.shipping_fee_id = 1
        @item.prefecture_id = 1
        @item.shipping_day_id = 1

        expect(@item).to be_valid
      end
    end
  end

  # 販売手数料と販売利益の計算
  context '計算ロジックのテスト' do
    let(:item) { FactoryBot.create(:item, user: user, price: 1000) }

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
