class Item < ApplicationRecord
  belongs_to :user
  has_many :orders

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  validates :image, :name, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :handling_time_id,
            presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, allow_blank: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :handling_time_id,
            inclusion: { in: 1.., message: 'Select' }

  validates :category_id, numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :delivery_charge_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :handling_time_id, numericality: { other_than: 0 }
end
