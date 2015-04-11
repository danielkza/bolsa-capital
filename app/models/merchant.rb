class Merchant < ActiveRecord::Base
  has_one :owner, class_name: 'User'
end
