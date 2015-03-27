class Ability
  include CanCan::Ability

  def initialize(user)

    # Set up default user with role "".
    user ||= User.new

    # Allow admins to do everything.
    if user.role == "Admin"
      can :manage, :all
    end
  end
end
