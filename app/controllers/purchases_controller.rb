class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_form = PurchaseForm.new
  end 

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    # パラメータからitem_idを取得し、対応するItemを取得
    @item = Item.find(params[:item_id])
  rescue ActiveRecord::RecordNotFound
    # Itemが見つからない場合、アイテム一覧にリダイレクト
    redirect_to items_path
  end

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end
end