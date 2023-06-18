class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :edit, :destroy]
  before_action :move_to_index, only: [:edit]



  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :handling_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless @item && current_user.id == @item.user_id
  end
end
