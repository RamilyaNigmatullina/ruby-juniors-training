class FeedbackPolicy < ApplicationPolicy
  def index?
    admin?
  end
end
