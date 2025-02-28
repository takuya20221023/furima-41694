class ItemsController < ApplicationController

    def index
      @items = Item.all # 商品一覧の取得
    end

end
