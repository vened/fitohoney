class FeedbacksCell < Cell::Rails

  def show
    @feedbacks = Feedback.all.limit(4)
    render
  end

end
