require "rails_helper"
require 'float'

RSpec.describe "Вложенные продукты (коллекции)", :type => :model do

  it 'Создание вложенных продуктов :create_nested_products' do
    @product = FactoryGirl.create(:product)
    @product1 = FactoryGirl.create(:product)
    @product2 = FactoryGirl.create(:product)

    @product.create_nested_products(@product1, 'Базовая плитка')
    @product.create_nested_products(@product2, 'Базовая плитка')

    @prod = Product.find(@product.id)
    @group = @prod.nested_products.find_by(title: 'Базовая плитка').products
    expect(@group).to include(@product1.id)
    expect(@group).to include(@product2.id)
    expect(@product1.parent_id).to eq(@prod.id)
    expect(@product2.parent_id).to eq(@prod.id)
  end

  # it 'Получение связанных продуктов' do
  #   @product = FactoryGirl.create(:product)
  #   @product1 = FactoryGirl.create(:product)
  #   @product2 = FactoryGirl.create(:product)
  # 
  #   @product.create_nested_products(@product1)
  #   @product.create_nested_products(@product2)
  #   @nested_products = @product.find_nested_products
  #   expect(@nested_products).to include(@product1)
  #   expect(@nested_products).to include(@product2)
  # end
  # 
  # it 'Получение связанных продуктов если их нет' do
  #   @product = FactoryGirl.create(:product)
  #   @product1 = FactoryGirl.create(:product)
  # 
  #   @nested_products = @product.find_nested_products
  #   expect(@nested_products).to eq([])
  # end
  # 
  # it 'Удаление связанного продукта' do
  #   @product = FactoryGirl.create(:product)
  #   @product1 = FactoryGirl.create(:product)
  #   @product2 = FactoryGirl.create(:product)
  # 
  #   @product.create_nested_products(@product1)
  #   @product.create_nested_products(@product2)
  # 
  #   @product.destroy_nested_product(@product1)
  #   
  #   expect(Product.find(@product.id).nested_products).to eq([@product2.id])
  #   expect(Product.find(@product1.id).parent_id).to eq(nil)
  # end


end

