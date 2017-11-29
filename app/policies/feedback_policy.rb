class FeedbackPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def new?
    true
  end

  def create?
    new?
  end
end
