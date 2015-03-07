class User < ActiveRecord::Base
  validates :name, 
            presence: true, 
            length: {minimum: 3}
  validates :email, presence: true
  
  has_secure_password
end
