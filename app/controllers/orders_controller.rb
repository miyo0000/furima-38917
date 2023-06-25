class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]



  def index
    @order = DonationAddress.new
  end

  def create
    donation_address_params = params.require(:donation_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number)
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

  def set_item
    @item = Item.find(params[:item_id])
  end

end
