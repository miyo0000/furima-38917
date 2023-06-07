class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time


  validates :name, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :handling_time_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A\d+\z/ }


  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :handling_time_id, numericality: { other_than: 0 }

end
