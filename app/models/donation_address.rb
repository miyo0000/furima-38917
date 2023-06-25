class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :history

  validates :post_code, :prefecture_id, :city, :address, :phone_number, presence: true
  validates :phone_number, length: { in: 10..11 }, format: { with: /\A\d+\z/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }

  def save
    donation = Donation.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, donation_id: donation.id)
  end

  def user=(user)
    self.user_id = user.id
  end
end