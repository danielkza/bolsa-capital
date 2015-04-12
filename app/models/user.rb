require 'date'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :investors, foreign_key: 'owner_id'
  has_many :merchants, foreign_key: 'owner_id'

  has_secure_password
  validates_presence_of :email, :name
  validates_uniqueness_of :email
end
