class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show]

  def index
    @feedbacks = Feedback.all
  end

  def show
  end


  private
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
