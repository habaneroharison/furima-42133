class Item < ApplicationRecord

  # ActiveHash関連付けを追加
  include ActiveHash::Associations::ActiveRecordExtensions
  


  # バリデーション設定
  validates :name, presence: { message: "can't be blank" }
  validates :description, presence: { message: "can't be blank" }
  validates :category_id, presence: { message: "can't be blank" }
  validates :status_id, presence: { message: "can't be blank" }
  validates :shipping_fee_id, presence: { message: "can't be blank" }
  validates :prefecture_id, presence: { message: "can't be blank" }
  validates :delivery_time_id, presence: { message: "can't be blank" }
  validates :price, presence: { message: "can't be blank" }
  validates :image, presence: { message: "can't be blank" }
  
  # 価格に関するバリデーション
  validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    message: "must be greater than or equal to 300" 
  }
  validates :price, numericality: { 
    only_integer: true, 
    less_than_or_equal_to: 9999999, 
    message: "must be less than or equal to 9999999" 
  }
  # 価格に関するバリデーション: 半角数値のみ許可
  validates :price, numericality: { only_integer: true, message: "is not a number" }
  # ActiveStorageで画像を管理
  has_one_attached :image

end