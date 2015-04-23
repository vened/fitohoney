require "rails_helper"
require 'float'

RSpec.describe "Продукты", :type => :model do

  before do
    @product = FactoryGirl.create(:product)
  end


  it 'Сохраненные данные' do
    expect(Product.last).to eq(@product)
  end

  it 'Правильный path' do
    expect(Product.last.path).to eq(@product.create_path)
  end

  it 'Правильный full_path если продукт без категории full_path == path' do
    expect(Product.last.full_path).to eq("/catalog/#{@product.path}")
  end

  it 'Создание продукта с категорией' do
    @category = FactoryGirl.create(:category)
    @category.products << @product
    expect(Product.last.category).to eq(@category)
    expect(Category.last.products.first).to eq(@product)
    expect(Category.last.products.first.path).to eq(@product.path)
    expect(Category.last.products.first.full_path).to eq("/catalog/#{@category.path}/#{@product.path}")
  end

  it 'Изменение названии категории, должен поменяться full_path связаных продуктов' do
    @category = FactoryGirl.create(:category)
    @category.products << @product
    @category.update(title: 'Новое название категории')
    expect(Category.last.products.first.full_path).to eq("/catalog/novoe-nazvanie-kategorii/#{@product.path}")
  end

  it 'Удаление, должен поменяться full_path связаных продуктов' do
    @category = FactoryGirl.create(:category)
    @category.products << @product
    @category.destroy
    expect(@product.full_path).to eq("/catalog/#{@product.path}")
  end

end

