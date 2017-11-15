class FeedbacksController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authorize_user!
  
  expose :feedback
  expose_decorated :feedbacks, :fetch_feedbacks

  def index
  end

  def new
    return unless user_signed_in?

    feedback.name = current_user.full_name
    feedback.email = current_user.email
  end

  def create
    feedback.save
    respond_with(feedback, location: root_path)
  end

  private

  def authorize_user!
    authorize feedback
  end

  def fetch_feedbacks
    Feedback.order(created_at: :desc).page(params[:page]).per(5)
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end

  def fetch_feedbacks
    Feedback.order(created_at: :desc).page(params[:page]).per(10)
  end
end
