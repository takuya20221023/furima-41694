class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_unless_owner, only: [:edit, :update, :destroy]


  def new
    @item = Item.new
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price, :image)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
    redirect_to root_path if @item.nil?
  end

  def redirect_unless_owner
    # 出品者でない、売却済み、または購入履歴がある場合、トップページへリダイレクト
    if current_user != @item.user || @item.sold_out? || @item.orders.exists?(user_id: current_user.id)
      redirect_to root_path, alert: "編集権限がありません"
    end
  end
end
