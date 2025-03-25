require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirth_day_dateが存在すれば登録できる' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid

    end
    context '新規登録できないとき' do
   
    it 'nicknameが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.last_name = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_day_dateが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.birth_day_date = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birth day date can't be blank")
    end

    it 'passwordにアルファベットと数字を含まないと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = '000000'
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'last_nameに使用できない文字が含まれていると登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.last_name = 'test@'
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
    end

    it 'first_nameに使用できない文字が含まれていると登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_name = 'test@'
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid. Input full-width characters")
    end

    it 'last_name_kanaにカタカナ以外を使用すると登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.last_name_kana = 'てすと'
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana Input full-width katakana characters")
    end

    it 'first_name_kanaにカタカナ以外を使用すると登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_name_kana = 'てすと'
      user.valid?
      expect(user.errors.full_messages).to include("First name kana Input full-width katakana characters")
    end
  end
  end
end
