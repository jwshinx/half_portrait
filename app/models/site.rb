class Site < ActiveRecord::Base
  attr_accessible :aasm_state, :failed, :processing, :submitted, :success, :url, :user_id   
  belongs_to :user   
  scope :processing_portrait, -> { where(aasm_state: "processing") }
                                      
  include AASM                        
  
  aasm do
    state :submitted, initial: true
    state :processing
    state :success
    state :failure
    
    #event :create_portrait, before: :aaa do
    #  transitions from: :submitted, to: :processing, guard: :valid_initialize_command?
    event :create_portrait do
      transitions from: :submitted, to: :processing
    end
    
    event :portrait_success, before: :bbb do
      transitions from: :processing, to: :success
    end                      
    
    event :portrait_failure, before: :ccc do
      transitions from: :processing, to: :failure
    end
  end
  
  def aaa
    true
  end    
  def valid_initialize_command?
    true
  end
end

# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  user_id    :integer
#  submitted  :boolean
#  processing :boolean
#  success    :boolean
#  failure    :boolean
#  aasm_state :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

