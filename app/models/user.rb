class User < ApplicationRecord
 
  has_secure_password

  REGEX_EMAIL = /^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$/
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
