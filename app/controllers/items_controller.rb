class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :ensure_owner, only: [:edit, :update]
  def index
    
    @items = Item.order(created_at: :desc)
  end
  
  def new
    @item = Item.new
  end

  def show

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

    def edit

    end
  
    def update
      if @item.update(item_params)
        redirect_to @item
      else
        render :edit, status: :unprocessable_entity
      end
    end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_owner
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

def item_params
  params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :shipping_fee_id, :delivery_time_id, :prefecture_id,:image).merge(user_id: current_user.id)
end
end
