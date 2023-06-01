class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true

  validates :encrypted_password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/,

  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/



end
