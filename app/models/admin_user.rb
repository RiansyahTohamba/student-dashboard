class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end

# # app/models/user.rb
# class User < ApplicationRecord
#   has_secure_password
#   validates :email, presence: true, uniqueness: true
#   validates :username, presence: true
# end