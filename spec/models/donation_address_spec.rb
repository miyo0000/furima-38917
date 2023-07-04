require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    @donation_address = FactoryBot.build(:donation_address)
  end

  describe 'OrderAddress登録' do
    context '登録がうまくいくとき' do
      it 'post_code, prefecture_id, city, address, phone_number,が存在すれば登録できる' do
        expect(@donation_address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @donation_address.building = nil
        expect(@donation_address).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @donation_address.token = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと登録できない' do
        @donation_address.post_code = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが-(hyphen)がないと登録できない' do
        @donation_address.post_code = '1234567'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefectureが「−−−」だと登録できない' do
        @donation_address.prefecture_id = '0'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'cityが空だと登録できない' do
        @donation_address.city = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @donation_address.address = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @donation_address.phone_number = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_namberが10桁か11桁でないと登録できない' do
        @donation_address.phone_number = 0o000
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
    end
  end
end
