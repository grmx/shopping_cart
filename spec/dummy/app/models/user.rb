class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, dependent: :destroy, class_name: 'ShoppingCart::Order'
  has_one  :credit_card, dependent: :destroy, class_name: 'ShoppingCart::CreditCard'
end
