class Staff::FeedbacksController < Staff::StaffController
  skip_before_action :verify_authenticity_token
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :set_feedback_path

  def index
    @feedbacks = Feedback.all
  end

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def edit
  end

  def create
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to staff_feedbacks_path, notice: 'Бренд успешно создан!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to staff_feedback_path(@feedback), notice: 'Товар успешно обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to staff_feedbacks_url, notice: 'Бренд успешно удален!' }
      format.json { head :no_content }
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:title, :prev, :body, :photo)
  end
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
  def set_feedback_path
    @feedbacks_path = true
  end
end
