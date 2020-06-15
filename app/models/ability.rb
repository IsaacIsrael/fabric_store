# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :access, :rails_admin   # grant access to rails_admin
    can :manage, :all
    cannot :manage, [User]
  end



end
