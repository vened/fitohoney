class ProductsCell < Cell::Rails

  def popular
    @products = Product.all.limit(4)
    @products2 = Product.all.limit(8)
    render
  end

end
