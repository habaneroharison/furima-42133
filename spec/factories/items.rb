FactoryBot.define do
  factory :item do
    name                   { "テスト商品" }
    description            { "これはテスト商品です" }
    category_id            { 2 }
    status_id              { 2 }
    shipping_fee_id        { 2 }
    prefecture_id          { 2 }
    delivery_time_id       { 2 }
    price                  { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end