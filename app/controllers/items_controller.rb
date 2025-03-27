class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end

  def create

  end
  
  private

def item_params
  params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :shipping_fee_id, :delivery_time_id, :prefecture_id, :user_id)
end
end
