# README


## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_day_date     | date                | null: false               |

### Association
has_many :items 
has_many :purchases

## items table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| description        | text                | null: false               |
| name               | string              | null: false               |
| price              | integer             | null: false               |
| category_id        | integer             | null: false               |
| status_id          | integer             | null: false                |
| shipping_fee_id    | integer             | null: false                |
| delivery_time_id   | integer             | null: false                |
| prefecture_id      | integer             | null: false                |
| user               | references          | null: false,foreign_key: true|

### Association
belongs_to :user
  has_one :purchase
  has_one_attached :image

## addresses table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| purchase           | references          | null: false,foreign_key: true|
| postal_code        | string              | null: false               |
| prefecture_id      | integer             | null: false               |
| city               | string              | null: false               |
| address            | string              | null: false               |
| building           | string              |                           |
| phone_number       | string              | null: false               |

### Association
belongs_to :purchase


## purchases table

| Column             | Type                |Options                      |
|--------------------|---------------------|-----------------------------|
| user               | references          | null: false,foreign_key: true|
| item               | references          | null: false,foreign_key: true|

### Association

belongs_to :user
  belongs_to :item
  has_one :address
