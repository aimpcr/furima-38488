require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の登録' do

    context '配送先情報の登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@order_form).to be_valid
      end
      it '建物名がなくても登録できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
      it '電話番号は10桁であれば登録できる' do
        @order_form.phone_number = '0123456789'
        expect(@order_form).to be_valid
      end
      it '電話番号は11桁であれば登録できる' do
        @order_form.phone_number = '01234567891'
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の登録ができないとき' do
      it '郵便番号がないと登録できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁でなければ登録できない' do
        @order_form.post_code = '2640007'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号は半角文字列でなければ登録できない' do
        @order_form.post_code = '２６４−０００７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県がなければ登録できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がなければ登録できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地がなければ登録できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がなければ登録できない' do
        @order_form.phone_number = ""
        @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は9桁以下では登録できない' do
        @order_form.phone_number = "01234567"
        @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は12桁以上では登録できない' do
        @order_form.phone_number = "012345678901"
        @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は半角数値でなければ登録できない' do
        @order_form.phone_number = "０１２３４５６７８９１"
        @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できない" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end

  end
end
