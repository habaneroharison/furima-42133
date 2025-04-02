class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]

  def index

    if user_signed_in?
      @purchase_form = PurchaseForm.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def set_item
    # パラメータからitem_idを取得し、対応するItemを取得
    @item = Item.find(params[:item_id])
  rescue ActiveRecord::RecordNotFound
    # Itemが見つからない場合、アイテム一覧にリダイレクト
    redirect_to items_path
  end

  def redirect_if_seller
    if current_user == @item.user
      redirect_to root_path
    end
  end

end