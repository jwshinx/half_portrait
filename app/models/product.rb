class Product < ActiveRecord::Base
  attr_accessible :allotment, :name, :period, :price 
  has_many :subscriptions, :through => :consumptions  
  has_many :consumptions
end

# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  allotment  :integer
#  price      :integer
#  period     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

