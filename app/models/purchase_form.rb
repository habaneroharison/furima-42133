class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  validates :user_id, presence: { message: "can't be blank" }
  validates :item_id, presence: { message: "can't be blank" }
  validates :postal_code, presence: { message: "can't be blank" }, format: { with: /\A\d{3}-\d{4}\z/, message: "must be in the format 123-4567" }
  validates :prefecture_id, inclusion: { in: 2..48, message: "can't be blank" } # ActiveHashの初期値1を除外
  validates :city, presence: { message: "can't be blank" }
  validates :address, presence: { message: "can't be blank" }
  validates :phone_number, presence: { message: "can't be blank" }, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }
  validates :token, presence: { message: "can't be blank" } # PAY.JPのトークン

  def save
    return false unless valid? # バリデーションエラー時は保存しない

    ActiveRecord::Base.transaction do
      purchase = Purchase.create!(user_id: user_id, item_id: item_id)

      Address.create!(
        purchase_id: purchase.id,
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        address: address,
        building: building,
        phone_number: phone_number
      )
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end