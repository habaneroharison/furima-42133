FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {'password'}
    last_name             {'てすと'}
    first_name            {'てすと'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birth_day_date        {'1935-10-10'}
  end
end