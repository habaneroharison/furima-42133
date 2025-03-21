# README


## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| id                 | integer             |  主キー                    |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |

### Association
has_many :items 
has_many :purchases

## items table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| id                 | integer             | 主キー                     |
| description        | text                | null: false               |
| name               | string              | null: false               |
| price              | integer             | null: false               |
| category           | string              | null: false               |
| status             | string              | null: false               |
| shipping_fee       | integer             | null: false               |
| user_id            | integer             | null: false,外部キー       |

### Association
belongs_to :user
  has_one :purchase
  has_one_attached :image

## addresses table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| id                 | integer             | 主キー                     |
| purchase_id        | integer             | null: false, 外部キー      |
| postal_code        | string              | null: false               |
| prefecture         | string              | null: false               |
| city               | string              | null: false               |
| address            | string              | null: false               |
| building           | string              | 任意                      |
| phone_number       | string              | null: false               |

### Association
belongs_to :purchase


## purchases table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| profile            | text                | null: false               |
| occupation         | text                | null: false               |
| position           | text                | null: false               |

### Association

belongs_to :user
  belongs_to :item
  has_one :address
