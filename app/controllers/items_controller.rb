class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index] # indexページだけログイン不要

  def index
    @items = Item.all # 商品一覧の取得
  end
end
