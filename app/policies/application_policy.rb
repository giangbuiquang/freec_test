# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    action_name =  __method__.to_s.remove("?")
    is_allowed?(action_name)
  end

  def show?
    action_name =  __method__.to_s.remove("?")
    is_allowed?(action_name)
  end

  def create?
    action_name =  __method__.to_s.remove("?")
    is_allowed?(action_name)
  end


  def update?
    action_name =  __method__.to_s.remove("?")
    is_allowed?(action_name)
  end

  def destroy?
    action_name =  __method__.to_s.remove("?")
    is_allowed?(action_name)
  end


  
  def is_allowed?(action_name)
    @user.is_admin?
  end


  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

end
