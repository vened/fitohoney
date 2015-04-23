class Staff::CategoriesController < Staff::StaffController
  skip_before_action :verify_authenticity_token
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_category_path

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to staff_categories_path, notice: 'Бренд успешно создан!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to staff_category_path(@category), notice: 'Товар успешно обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to staff_categories_url, notice: 'Бренд успешно удален!' }
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :path)
  end
  def set_category
    @category = Category.find(params[:id])
  end
  def set_category_path
    @categories_path = true
  end
end
