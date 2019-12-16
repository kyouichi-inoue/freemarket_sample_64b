class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  has_one :card 
  accepts_nested_attributes_for :card


  validates :nickname, presence: true, uniqueness: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :encrypted_password, presence: true
  # validates :birth_year, presence: true
  # validates :birth_month, presence: true
  # validates :birth_day, presence: true
  # validates :phone_number, presence: true, uniqueness: true





  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birthyear 
  belongs_to_active_hash :birthmonth
  belongs_to_active_hash :birthday
end
