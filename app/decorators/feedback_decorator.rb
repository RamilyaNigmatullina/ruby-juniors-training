class FeedbackDecorator < ApplicationDecorator
  delegate :id, :name, :email, :text, :created_at

  def created_at
    I18n.l(object.created_at, format: :ru_date)
  end
end
