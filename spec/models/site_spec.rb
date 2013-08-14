require 'spec_helper'                       
require 'cancan/matchers'

describe Site do
  describe "privilege" do
    subject { my_ability }
    let(:my_ability) { Ability.new(@user) }
    describe "for admin" do
     before(:each) { @user = mock_model User, admin?: true }
     it { should be_able_to(:read, Site.new) }
     it { should be_able_to(:update, Site.new) }
     it { should be_able_to(:create, Site.new) }
     it { should be_able_to(:destroy, Site.new) }
    end
    describe "for manager" do
     before(:each) { @user = mock_model User, manager?: true, admin?: false }
     it { should be_able_to(:read, Site.new) }
     it { should be_able_to(:update, Site.new) }
     it { should be_able_to(:create, Site.new) }
     it { should be_able_to(:destroy, Site.new) }
    end
    describe "for all else" do
     before(:each) { @user = mock_model User, manager?: false, admin?: false }
     it { should_not be_able_to(:read, Site.new) }
     it { should_not be_able_to(:update, Site.new) }
     it { should_not be_able_to(:create, Site.new) }
     it { should_not be_able_to(:destroy, Site.new) }
    end
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

