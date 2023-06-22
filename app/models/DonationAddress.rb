class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :prefecture_id, :city, :address, :building, :phone_number, :history
  end

  validate :user_id, :item_id, :post_cord, :prefecture_id, :city, :address, :building, :phone_number, :history,  presence: true

  

  def save
    donation = Donation.create(price: price, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number donation_id: donation.id)
    
  end
end