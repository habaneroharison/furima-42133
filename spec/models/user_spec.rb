require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirth_day_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複している場合は登録できない' do
        existing_user = FactoryBot.create(:user, email: 'test@mial')
        @user.email = 'test@mial'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailが@を含まない場合は登録できない' do
        @user.email = 'testmail' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空だと登録できない' do
        @user.password = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = 'test0' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password = 'testtest' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'passwordが数字のみのパスワードでは登録できない' do
        @user.password = '000000' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'passwordが全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｔｅｓｔ０００' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
         @user.password = 'test000'
         @user.password_confirmation = 'test111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birth_day_dateが空だと登録できない' do
        @user.birth_day_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day date can't be blank")
      end

      it 'passwordにアルファベットと数字を含まないと登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'last_nameに使用できない文字が含まれていると登録できない' do
        @user.last_name = 'test@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end

      it 'first_nameに使用できない文字が含まれていると登録できない' do
        @user.first_name = 'test@'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end

      it 'last_name_kanaにカタカナ以外を使用すると登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Input full-width katakana characters")
      end

      it 'first_name_kanaにカタカナ以外を使用すると登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Input full-width katakana characters")
      end
    end
  end
end