require 'spec_helper'
require 'cancan/matchers'

describe User do   
  before { @joel = User.new }         
  describe "when user is an admin" do
    before { @joel.stub role: double(name: 'admin') } 
    describe "admin?" do
      it "returns true" do       
        @joel.admin?.should be_true  
      end
    end 
    describe "manager?" do
      it "returns false" do       
        @joel.manager?.should be_false  
      end
    end                           
  end
  describe "when user is a manager" do
    before { @joel.stub role: double(name: 'manager') }  
    describe "admin?" do
      it "returns false" do       
        @joel.admin?.should be_false  
      end
    end   
    describe "manager?" do
      it "returns true" do       
        @joel.manager?.should be_true  
      end
    end
  end
  describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, User.new) }
    it { should be_able_to(:update, User.new) }
    it { should be_able_to(:create, User.new) }
    it { should be_able_to(:destroy, User.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, User.new) }
    it { should_not be_able_to(:update, User.new) }
    it { should_not be_able_to(:create, User.new) }
    it { should_not be_able_to(:destroy, User.new) }
    it "should be able to update own information" do
     my_ability.should be_able_to(:update, @user)
    end
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, User.new) }
    it { should_not be_able_to(:update, User.new) }
    it { should_not be_able_to(:create, User.new) }
    it { should_not be_able_to(:destroy, User.new) }
   end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#  subscription_id        :integer
#

