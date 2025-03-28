class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id]) # item_idをパラメータから取得して、@itemを設定
    @order_form = OrderForm.new
  rescue ActiveRecord::RecordNotFound
    # 商品が見つからない場合の処理
    redirect_to root_path, alert: '商品が見つかりませんでした。'
  end
    
  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token)
          .merge(user_id: current_user.id, item_id: params[:item_id], price: params[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end


end