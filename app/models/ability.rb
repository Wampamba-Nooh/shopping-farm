class Ability
  include CanCan::Ability

  def initialize(user)
   user ||= User.new
    
    if user.is? :admin
        can :display_admin_home, nil
        #can :manage, :all
    end
    if user.is? :customer
        can :display_customer_home, nil
        #can :access, :projects
    end
    if user.is? :manager
        can :display_manager_home, nil
        #can :access, :projects
    end
    if user.is? :dealer
        can :display_dealer_home, nil
        #can :access, :projects
    end

  end
end
