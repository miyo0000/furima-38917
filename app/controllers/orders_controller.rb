class OrdersController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:index, :create]



  def index
    @order = DonationAddress.new
  end

  def new
  end


  def create
    donation_address_params = params.require(:donation_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
    @order = DonationAddress.new(donation_address_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end



  private

  def pay_item
    Payjp.api_key = "sk_test_9c9e50fcf8e6991777d58ec8"
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    #params.permit(:token).merge(item_price: @item_price, token: params[:token])
    params.require(:donation_address).permit(:@item_price).merge(token: params[:token], user_id: current_user.id)
    #params.permit(:post_code, :prefecture, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], token: params[:token])
  end

  def adress_params
    #params.permit(:token).merge(item_price: @item_price, token: params[:token])
    #arams.require(:donation_address).permit(:@item_price).merge(token: params[:token], oreder_id: @order.id)
    params.permit(:post_code, :prefecture, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], oreder_id: @order.id)
  end

end
