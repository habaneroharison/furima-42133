FactoryBot.define do
  factory :purchase_form do
    user_id        { 1 }
    item_id        { 1 }
    postal_code    { '123-4567' }
    prefecture_id  { 2 } # 1は「未選択」なので、それ以外の値を指定
    city           { '東京都' }
    address        { '渋谷区1-1-1' }
    building       { '東京ハイツ101' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end