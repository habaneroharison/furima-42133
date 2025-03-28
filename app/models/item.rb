class Item < ApplicationRecord

  # ActiveHash関連付けを追加
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  # バリデーション設定
  validates :name, presence: { message: "can't be blank" }
  validates :description, presence: { message: "can't be blank" }
  validates :category_id, inclusion: { in: 2..11, message: "can't be blank" }
  validates :status_id, inclusion: { in: 2..7, message: "can't be blank" }
  validates :shipping_fee_id, inclusion: { in: 2..3, message: "can't be blank" }
  validates :prefecture_id, inclusion: { in: 2..48, message: "can't be blank" } # 都道府県は47
  validates :delivery_time_id, inclusion: { in: 2..4, message: "can't be blank" }
  validates :price, presence: { message: "can't be blank" }
  validates :image, presence: { message: "can't be blank" }
  
  # 価格に関するバリデーション
  validates :price, numericality: { 
  
    greater_than_or_equal_to: 300, 
    message: "must be greater than or equal to 300" 
  }
  validates :price, numericality: { 
  
    less_than_or_equal_to: 9999999, 
    message: "must be less than or equal to 9999999" 
  }
  #  半角数値のみ許可
  validates :price, numericality: { only_integer: true, message: "is not a number" }
  # ActiveStorageで画像を管理
  has_one_attached :image

end