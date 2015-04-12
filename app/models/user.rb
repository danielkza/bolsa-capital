class User < ActiveRecord::Base
  has_many :investors
  has_many :merchants

  has_secure_password
  validates_presence_of :email, :password, :name
  validates_uniqueness_of :email
end
