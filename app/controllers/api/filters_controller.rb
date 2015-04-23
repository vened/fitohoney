class Api::FiltersController < ApplicationController


  # получение фильтров для текущей категории требуется :category_id
  def filters
    @category = Category.find_by(id: params[:category_id])
    @filters = @category.filter_params
    render json: @filters
  end


  # фильтрация товаров в категории 
  # на вход принимает следующие параметры -
  # {"category_id"=>"552ebf7c6d61783d966f0100", "filter"{\"2\":{\"name\":\"Страна\",\"value\":\"Сенегал\"}}"}
  def filtering
    @category = Category.find_by(_id: params[:category_id])
    @filters = @category.filtering(params[:filter])
    render json: @filters
  end


  private
  def set_product_path
    @products_path = true
  end
end
