class ItemsController < ApplicationController
    def index
      @items = Item.all  # データ取得（なくてもOK）
    end
end
