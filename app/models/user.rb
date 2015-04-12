require 'date'

class User < ActiveRecord::Base
  has_many :investors, foreign_key: 'owner_id'
  has_many :merchants, foreign_key: 'owner_id'

  has_secure_password
  validates_presence_of :email, :password_digest, :name
  validates_uniqueness_of :email
end
