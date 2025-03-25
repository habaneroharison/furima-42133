require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
   
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: 't', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '', last_name: 'てすと', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: '', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'てすと', last_name_kana:'', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_day_dateが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'')
      user.valid?
      expect(user.errors.full_messages).to include("Birth day date can't be blank")
    end

    it 'passwordにアルファベットと数字を含まないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '0000000', password_confirmation: '0000000', last_name: 'てすと', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'last_nameに使用できない文字が含まれていると登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'test@', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
    end

    it 'fiast_nameに使用できない文字が含まれていると登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'test@', last_name_kana:'テスト', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid. Input full-width characters")
    end

    it 'last_name_kanaにカタカナ以外を使用すると登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'てすと', last_name_kana:'てすと', first_name_kana:'テスト', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana Input full-width katakana characters")
    end

    it 'first_name_kanaにカタカナ以外を使用すると登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000', password_confirmation: 'test000', last_name: 'てすと', first_name:'てすと', last_name_kana:'テスト', first_name_kana:'てすと', birth_day_date:'1935-10-10')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana Input full-width katakana characters")
    end

  end
end
