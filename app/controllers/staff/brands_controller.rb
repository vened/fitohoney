class Staff::BrandsController < Staff::StaffController
  skip_before_action :verify_authenticity_token
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :set_brand_path

  def index
    @brands = Brand.all
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)
    respond_to do |format|
      if @brand.save
        format.html { redirect_to staff_brands_path, notice: 'Бренд успешно создан!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to staff_brand_path(@brand), notice: 'Товар успешно обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to staff_brands_url, notice: 'Бренд успешно удален!' }
      format.json { head :no_content }
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:title, :path, :photo)
  end
  def set_brand
    @brand = Brand.find(params[:id])
  end
  def set_brand_path
    @brands_path = true
  end
end
