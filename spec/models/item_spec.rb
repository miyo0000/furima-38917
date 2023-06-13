require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it ':image,:name,:detail,:price,:category_id,f:condition_id,delivery_charge_id,:perfecture_id,:handling_time_idが存在すれば登録できる' do
        expect(@item.valid?).to eq true
      end
      it ':priceが半角数字でかつ300〜9999999の間の金額であるとき' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it ':imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it ':nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it ':detailが空だと登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it ':priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it ':priceが半角数字以外だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it ':priceが299以下の場合は登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it ':priceが10,000,000以上の場合は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it ':category_idが「---」だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it ':condition_idが「---」だと登録できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it ':delivery_charge_idが「---」だと登録できない' do
        @item.delivery_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge Select')
      end
      it ':prefecture_idが「---」だと登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it ':handling_time_idが「---」だと登録できない' do
        @item.handling_time_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Handling time Select')
      end

      it 'ユーザー情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
