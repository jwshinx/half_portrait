class Customer < ActiveRecord::Base
  attr_accessible :active, :firstname, :lastname      
  has_many :subscriptions
end

# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

