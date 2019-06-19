class ApplicationPolicy
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
    user
  end

  def new?
    user
  end

  def update?
    user && (user.id == record.user_id)
  end

  def edit?
    user && (user.role == 'admin' || user.id == record.user_id)
  end

  def destroy?
    user && (user.role == 'admin' || user.id == record.user_id )
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
