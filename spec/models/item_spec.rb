require 'rails_helper'

RSpec.describe Item, type: :model do
  # バリデーションテスト
  context 'バリデーションのテスト' do
    before do
      # バリデーションテスト用のインスタンスをFactoryBotで生成
      @item = FactoryBot.build(:item)
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
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が9999999円以上だと保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が半角数字以外だと保存できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'category_idが1だと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが1だと保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_fee_idが1だと保存できないこと' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが1だと保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_day_idが1だと保存できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'ユーザー情報がないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像が空の場合保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end

    context '正常系' do
      it '全ての条件が整っていると保存できること' do
        expect(@item).to be_valid
      end
    end
  end
end
