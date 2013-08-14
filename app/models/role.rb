class Role < ActiveRecord::Base
  attr_accessible :description, :name 
  validates :name, :presence => true, :length => { :minimum => 1 }
  validates :description, :presence => true, :length => { :minimum => 1 }
  has_many :users
end

# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

