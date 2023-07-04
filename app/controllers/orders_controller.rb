class OrdersController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!

  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order = DonationAddress.new
  end

  def new
  end

  def create
    donation_address_params = params.require(:donation_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
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
    Payjp.api_key = 'sk_test_9c9e50fcf8e6991777d58ec8'
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:donation_address).permit(:@item_price).merge(token: params[:token], user_id: current_user.id)
  end

  def adress_params
    params.permit(:post_code, :prefecture, :city, :address, :building, :phone_number).merge(item_id: params[:item_id],
                                                                                            oreder_id: @order.id)
  end

  def move_to_index
    # sign_inしていないと購入ページに遷移できない
    redirect_to new_user_session_path unless user_signed_in?
    # 出品者が購入ページに遷移できない
    if current_user.id == @item.user_id
      redirect_to root_path
    # 購入済みの商品の購入ページに遷移できない
    elsif Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
