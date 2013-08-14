class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :read, :all 
      can :read, User, :id => user.id  
      # devise registration
      #cannot :create, User
      can :update, User, :id => user.id      
    else
    end
  end
end
