require "rails_helper"
require 'float'

RSpec.describe "Корзина", :type => :model do

  before do
    @order = FactoryGirl.create(:order)
    @order_id = @order.id
    @product = FactoryGirl.create(:product)
  end

  # :ToDo номер генерируется не правильный, допилить метод :order_number_increment
  it 'Создание корзины и проверка правильной генерации номера заказа :number' do
    10.times do
      FactoryGirl.create(:order)
    end
    expect(Order.first.number).not_to eq(2)
    expect(Order.last.number).to eq(10)
  end

  it 'Добавление товара в корзину и создание корзины, проверяем кол-во товара в корзине и сумму заказа' do
    # стоимость продукта 28.23, 6563
    # unit 24.56, 300
    # 28.23*24.56=693.3288 округляется до 693.33
    # 6563*300=1968900
    # 693.33+1968900=1969593.33 
    product1 = FactoryGirl.create(:product_price_float)
    product2 = FactoryGirl.create(:product_price)
    @order.order_product_add(product2.id, 300)
    @order.order_product_add(product1.id, 24.56)

    @order = Order.find(@order_id)
    expect(@order.order_items.find_by(product_id: product1.id).price).to eq(693.33)
    expect(@order.order_items.find_by(product_id: product2.id).price).to eq(1968900)
    expect(@order.count_items).to eq(2)
    expect(@order.price).to eq(1969593.33)
  end

  it 'count = 0' do 
    @order.order_product_add(@product, '0')
    @order = Order.find(@order_id)
    expect(@order.order_items.find_by(product_id: @product.id).price).to eq(@product.price)    
    expect(@order.count_items).to eq(1)
    expect(@order.price).to eq(@product.price)
  end

  it 'изменение кол-ва продуктов в корзине' do
    # стоимость продукта 28.23, 6563
    # unit 24.56, 300
    # 28.23*24.56=693.3288 округляется до 693.33
    # 6563*300=1968900
    # 693.33+1968900=1969593.33
    # меняем 24.56 на 12.19
    # 28.23*12.19=344.12
    # 344.12+1968900=1969244.12
    product1 = FactoryGirl.create(:product_price_float)
    product2 = FactoryGirl.create(:product_price)
    @order.order_product_add(product1.id, 24.56)
    @order.order_product_add(product2.id, 300)

    @order = Order.find(@order_id)
    expect(@order.order_items.find_by(product_id: product1.id).price).to eq(693.33)
    expect(@order.count_items).to eq(2)
    expect(@order.price).to eq(1969593.33)
    @order.order_product_add(product1.id, 12.19)
    @order = Order.find(@order_id)
    expect(@order.order_items.find_by(product_id: product1.id).price).to eq(344.12)
    expect(@order.count_items).to eq(2)
    expect(@order.price).to eq(1969244.12)
  end

  it 'Удаление товара из корзины' do
    product1 = FactoryGirl.create(:product_price_float)
    product2 = FactoryGirl.create(:product_price)
    @order.order_product_add(@product.id, 30)
    @order.order_product_add(product2.id, 300)
    @order.order_product_add(product1.id, 24.56)

    Order.find(@order_id).item_delete(@product.id)
    @order = Order.find(@order_id)
    expect(@order.count_items).to eq(2)
    expect(@order.price).to eq(1969593.33)
  end

end

