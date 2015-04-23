class Staff::CarouselsController < Staff::StaffController
  skip_before_action :verify_authenticity_token
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]
  before_action :set_carousel_path

  def index
    @carousels = Carousel.all
  end

  def show
  end

  def new
    @carousel = Carousel.new
  end

  def edit
  end

  def create
    @carousel = Carousel.new(carousel_params)
    respond_to do |format|
      if @carousel.save
        format.html { redirect_to staff_carousels_path, notice: 'Бренд успешно создан!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to staff_carousels_path, notice: 'Карусель успешно обновлена!' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html { redirect_to staff_carousels_url, notice: 'Карусель успешно удален!' }
    end
  end

  private
  def carousel_params
    params.require(:carousel).permit(:title, :description, :path, :photo)
  end
  def set_carousel
    @carousel = Carousel.find(params[:id])
  end
  def set_carousel_path
    @carousel_path = true
  end
end
