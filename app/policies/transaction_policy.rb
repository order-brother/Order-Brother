class TransactionPolicy < StorePolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
      else
        scope.where
      end
    end
  end
end
