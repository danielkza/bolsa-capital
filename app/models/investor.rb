class Investor < ActiveRecord::Base
  has_one :owner, class_name: 'User'
end
