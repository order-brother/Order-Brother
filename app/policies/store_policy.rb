class StorePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.id == record.user_id
  end

  def edit?
    user.id == record.user_id
  end

  def destroy?
    user.id == record.user_id
  end
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
