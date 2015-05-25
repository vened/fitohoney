class Staff::ProductsController < Staff::StaffController
  skip_before_action :verify_authenticity_token
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_product_path, only: [:index, :show, :new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end
  
  def new
    @product = Product.new
  end
  
  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to staff_product_path(@product), notice: 'Товар успешно создан!' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to staff_product_path(@product), notice: 'Товар успешно обновлен!' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to staff_products_url, notice: 'Товар успешно удален!' }
      format.json { head :no_content }
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_product_path
    @products_path = true
  end

  def product_params
    params.require(:product).permit(:product_id, :title, :description, :price, :price_origin, :sale, :unit, :measure,
                                    :measure_1, :measure_1_price, :measure_2, :measure_2_price, :measure_3, :measure_3_price
    )
  end
end
