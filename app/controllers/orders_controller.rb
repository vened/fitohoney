class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: [:show, :create, :update, :mini_cart, :cart_item_delete]


  def show
  end


  def mini_cart
    render :json => @order.cart
  end


  def create
    @order.order_product_add(order_params[:product_id], order_params[:count])
    render :json => @order.cart
  end


  def update
    if @order.update(order_params)
      OrderMailer.new_order(@order).deliver_now
      OrderMailer.confirm_order(@order).deliver_now
      reset_session
      render :json => {success: "Заказ успешно оформлен! Наш менеджер скоро свяжется с вами."}
    else
      render :json => {error: "Что то пошло не так:("}
    end
  end
  

  def cart_item_delete
    @order.item_delete(params[:product_id])
    render json: @order.cart
  end

  private
  def order_params
    params.require(:order).permit(:product_id, :email, :address, :count, :phone, :name)
  end


  def set_order
    @order = Order.find_by(session_id: session[:session_id])
    if @order.blank?
      @order = Order.create(session_id: session[:session_id])
    end
  end
end
