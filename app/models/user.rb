class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :cash, :password, :username, :password_confirmation

  has_many :stocks

  validates :username, uniqueness: true
end
