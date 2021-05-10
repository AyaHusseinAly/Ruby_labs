class Ability
    include CanCan::Ability
  
    def initialize(user)
      can :read, Article, public: true
  
      if user.present?  # additional permissions for logged in users (they can read their own posts)
        can :manage, Article, user_id: user.id
      end
    end
  end