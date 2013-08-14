class Consumption < ActiveRecord::Base
  attr_accessible :subscription_id, :product_id
  belongs_to :product
  belongs_to :subscription
end

# == Schema Information
#
# Table name: consumptions
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  subscription_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

