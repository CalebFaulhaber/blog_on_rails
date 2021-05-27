class User < ApplicationRecord
 
  has_secure_password
  has_many :posts
  has_many :comments

  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, 
      presence: { message: 'Must include a name' }, 
      length: { minimum: 3 }
  validates :email, 
      presence: { message: 'Must be a valid email' }, 
      uniqueness: true,
      length: { minimum: 6 }, 
      format: REGEX_EMAIL
  validates :password_digest, 
      presence: true



end
