class Ability
    include CanCan::Ability
  
    def initialize(user)
      can :read, Article, public: true
  
      if user.present?  # additional permissions for logged in users (they can read their own posts)
        can :read, Article, user_id: user.id
  
       # if user.admin?  # additional permissions for administrators
       #   can :read, Article
       # end
      end
    end
  end