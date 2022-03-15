class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # allows for database authentication, registering a user, recovering password, validating data, remembering user. 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
