class Subscription < ActiveRecord::Base
  attr_accessible :active, :anniversary_date, :customer_id, :product_id
  has_many :products, :through => :consumptions  
  has_many :consumptions
  belongs_to :customer   
  has_one :user
end

# == Schema Information
#
# Table name: subscriptions
#
#  id               :integer          not null, primary key
#  anniversary_date :date
#  active           :boolean
#  customer_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

