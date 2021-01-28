class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user) # user that created it
      scope.all # to show all restaurants
    end
  end

  # def new? (cuz looks in application policy which looks
  # at new? which has create? which is in here and its where
  # it looks first before application policy)
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # If the user is the owner of the restaurant => true
  #   # Otherwise => false
  #   # user => current_user
  #   # record => @restaurant (argument passed to 'authorize')
  #   user == record.user
  # end

  def update?
    user_is_owner_or_admin
  end

  def destroy?
    user_is_owner_or_admin
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
