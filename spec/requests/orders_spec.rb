require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /index' do
    before do
      # 必要に応じてデータの準備（例えば、複数の注文を作成）
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      FactoryBot.create(:order, user: @user, item: @item, price: 1000)
      FactoryBot.create(:order, user: @user, item: @item, price: 2000)
    end

    it 'returns a successful response' do
      get orders_path # `orders_path` は `GET /orders` に対応するパス
      expect(response).to have_http_status(:success)
    end

    it 'loads all orders' do
      get orders_path
      # 作成した注文の数とレスポンスに含まれる注文の数が一致することを確認
      expect(assigns(:orders).count).to eq(2)
    end

    it 'displays the correct content' do
      get orders_path
      # レスポンスに注文内容が表示されているか確認
      expect(response.body).to include('1000')
      expect(response.body).to include('2000')
    end
  end
end
