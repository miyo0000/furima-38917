class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :handling_time_id, :user).merge(user_id: current_user.id)
  end
end
