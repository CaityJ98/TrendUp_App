class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # allows for database authentication, registering a user, recovering password, validating data, remembering user. 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings 
  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order"
  has_many :bought_orders, foreign_key: "buyer_id", class_name: "Order"
end
