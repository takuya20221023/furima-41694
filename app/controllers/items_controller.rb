class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :redirect_unless_owner, only: [:edit, :update]

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
  end

  def edit
    return if user_signed_in?

    redirect_to action: :index
  end

  def update
    params[:item][:image] = @item.image if params[:item][:image].blank?

    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報を更新しました'
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def redirect_unless_owner
    redirect_to root_path unless @item.user_id == current_user.id
  end
end
