class FeedbackDecorator < ApplicationDecorator
  delegate :id, :name, :email

  delegate :text, :created_at, to: :object

  def formatted_text
    h.simple_format(text)
  end

  def created_time_ago
    h.time_ago_in_words(created_at)
  end
end
