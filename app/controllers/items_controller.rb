class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
    @order = Order.new
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました'
    else
      flash.now[:alert] = '商品の出品に失敗しました。入力内容を確認してください。'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find_by(id: params[:id])  # find_by を使うと nil を返すのでエラーを防げる
    unless @item
      redirect_to root_path, alert: "商品が見つかりません"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price, :image)
  end
end
