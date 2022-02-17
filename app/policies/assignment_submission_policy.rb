class AssignmentSubmissionPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    [
      'student'
    ].include?(user.role)
  end

  def edit?
    [
      'teacher'
    ].include?(user.role)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end