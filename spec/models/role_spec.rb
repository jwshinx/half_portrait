require 'spec_helper'
require 'cancan/matchers'

describe Role do
  describe "privilege" do
    subject { my_ability }
    let(:my_ability) { Ability.new(@user) }
    describe "for admin" do
     before(:each) { @user = mock_model User, admin?: true }
     it { should be_able_to(:read, Role.new) }
     it { should be_able_to(:update, Role.new) }
     it { should be_able_to(:create, Role.new) }
     it { should be_able_to(:destroy, Role.new) }
    end
    describe "for manager" do
     before(:each) { @user = mock_model User, manager?: true, admin?: false }
     it { should be_able_to(:read, Role.new) }
     it { should_not be_able_to(:update, Role.new) }
     it { should_not be_able_to(:create, Role.new) }
     it { should_not be_able_to(:destroy, Role.new) }
    end
    describe "for all else" do
     before(:each) { @user = mock_model User, manager?: false, admin?: false }
     it { should_not be_able_to(:read, Role.new) }
     it { should_not be_able_to(:update, Role.new) }
     it { should_not be_able_to(:create, Role.new) }
     it { should_not be_able_to(:destroy, Role.new) }   
    end
  end
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

