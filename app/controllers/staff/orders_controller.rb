class Staff::OrdersController < Staff::StaffController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_order_path, only: [:index, :show, :new, :edit, :update, :destroy]

  def index
    @orders = Order.where(status: 0).desc(:updated_at).page(params[:page])
  end
  
  def success
    @orders = Order.where(status: 1).desc(:created_at).page(params[:page])
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
      if @order.update(order_params)
        format.html { redirect_to staff_orders_path, notice: 'Товар успешно обновлен!' }
      else
        format.html { redirect_to staff_order_path(@order), notice: 'Товар успешно обновлен!' }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to staff_orders_url, notice: 'Заказ успешно удален!' }
      format.json { head :no_content }
    end
  end

  def cart_item_delete
    @order = Order.find_by(session_id: params[:order_id])
    @order.item_delete(params[:item_id])
    respond_to do |format|
        format.html { redirect_to staff_order_path(@order), notice: 'Заказ успешно обновлен!' }
    end
  end


  private
  def set_order
    @order = Order.find(params[:id])
  end

  def set_order_path
    @orders_path = true
  end

  def order_params
    params.require(:order).permit(:id, :order_id, :name, :price, :status)
  end
end
