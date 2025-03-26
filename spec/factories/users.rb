FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'test000'}
    password_confirmation {'test000'}
    last_name             {'てすと'}
    first_name            {'てすと'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birth_day_date        {'1935-10-10'}
  end
end