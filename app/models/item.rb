class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :delivery_charge_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :handling_time_id


  validates :name, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :handling_time_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A\d+\z/ }
end

  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :handling_time_id, :numericality: { other_than: 0 }

end
