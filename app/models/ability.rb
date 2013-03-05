class Ability
  include CanCan::Ability

  def initialize(user)

    @user = user
    send(@user.role) if @user
  end

  def admin
    
  end

  def comentator
    can :read, Article
  end
end
