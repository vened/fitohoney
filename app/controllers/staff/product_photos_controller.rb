class Staff::ProductPhotosController < Staff::StaffController
  skip_before_action :verify_authenticity_token

  def upload_product_photo
    @product = Product.find(params[:product_id])
    @product.product_photos.create(:photo => params[:photo])
    render json: @product
  end

  def show_product_photos
    @product = Product.find(params[:product_id])
    render json: @product.product_photos
  end

  def destroy_product_photo
    @product = Product.find(params[:product_id])
    @photo = @product.product_photos.find(params[:photo_id])
    @photo.destroy
    render json: @photo
  end

  private
  def photos_params
    params.require(:product_photos).permit(:product_id, :title, :description, :price, :photo)
  end
end
