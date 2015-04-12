class Merchant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  validates_presence_of :name, :code, :owner_id, :address
  validates_associated :owner
  validates_uniqueness_of :code
end