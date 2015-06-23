class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show]

  def index
    @feedbacks = Feedback.all
  end

  def show
    unless @feedback.present?
      render template: 'errors/404', status: 404
    end
  end


  private
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
