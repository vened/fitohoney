class Staff::Api::PropertiesController < Staff::StaffController
  skip_before_action :verify_authenticity_token

  def all
    @product = Product.find(params[:product_id])
    @properties = @product.properties
    render json: @properties
  end

  def create
    @product = Product.find(params[:product_id])
    @property = @product.properties.create(property_params)
    render :json => @product, status: :created
  end

  def destroy_product_photo
    @product = Product.find(params[:product_id])
    @photo = @product.product_photos.find(params[:photo_id])
    @photo.destroy
    render json: @photo
  end

  def destroy
    @product = Product.find(params[:product_id])
    @property = @product.properties.find(params[:property_id])
    @property.destroy
    render json: @product.properties
  end

  private
  def property_params
    params.require(:property).permit(:name, :size, :value, :product_id, :property_id, :value_id, :set_product)
  end
end
