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
end
