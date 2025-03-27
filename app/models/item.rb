class Item < ApplicationRecord
  # バリデーション設定
  validates :name, presence: true  # 商品名は必須
  validates :description, presence: true  # 商品説明は必須
  validates :category_id, presence: true  # カテゴリーは必須
  validates :status_id, presence: true  # 商品の状態は必須
  validates :shipping_fee_id, presence: true  # 配送料の負担は必須
  validates :prefecture_id, presence: true  # 発送元の地域は必須
  validates :delivery_time_id, presence: true  # 発送までの日数は必須
  validates :price, presence: true  # 価格は必須
  validates :image, presence: true  # 画像は必須
  
  # 価格に関するバリデーション
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  # 価格に関するバリデーション: 半角数値のみ許可
  validates :price, numericality: { only_integer: true}
  # ActiveStorageで画像を管理
  has_one_attached :image
  
  # 他の関連付けなど
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_time
end