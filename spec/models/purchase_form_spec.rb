require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '購入情報の保存' do
    context '購入ができる場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@purchase_form).to be_valid
      end

      it '建物名が空でも保存できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '購入ができない場合' do
      it 'user_idが空では保存できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空では保存できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが「123-4567」の形式でないと保存できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code must be in the format 123-4567")
      end

      it 'prefecture_idが1（未選択）では保存できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できない' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満では保存できない' do
        @purchase_form.phone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number must be 10 or 11 digits")
      end

      it 'phone_numberが12桁以上では保存できない' do
        @purchase_form.phone_number = '123456789012'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number must be 10 or 11 digits")
      end

      it 'phone_numberが半角数字以外を含むと保存できない' do
        @purchase_form.phone_number = '090-1234-5678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number must be 10 or 11 digits")
      end

      it 'tokenが空では保存できない' do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end