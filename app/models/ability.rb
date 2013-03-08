class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    if @user && @user.role
      send @user.role
    else
      guest
    end
  end

  def guest
    can :read, Article
    can :read, Comment
  end

  def comentator
    can :read, Article
    can [ :read, :create ], Comment    
  end

  def newsmaker
    can [ :read, :create ], Article
    can :update, Article, :user_id => @user.id
    can [ :read, :create ], Comment    
  end

  def admin
    can :manage, :all
    can :update, Article
    can :featured, Article
  end
end
