class FeedbacksController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authorize_user!

  before_action :setup_feedback, only: :new, if: :user_signed_in?

  expose :feedback
  expose_decorated :feedbacks, :fetch_feedbacks

  def index
  end

  def new
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

  def setup_feedback
    feedback.name = current_user.full_name
    feedback.email = current_user.email
  end
end
