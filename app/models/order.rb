class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :number, type: Integer, default: 0
  field :status, type: Integer, default: 0
  field :session_id, type: String, default: ''
  field :email, type: String, default: ''
  field :name, type: String, default: ''
  field :phone, type: String, default: ''
  field :address, type: String, default: ''
  field :created_at, type: Time
  field :updated_at, type: Time

  embeds_many :order_items


  ###########################################
  # предобработка объекта перед сохранением #
  ###########################################
  before_save :order_number_increment

  paginates_per 10

  ######################################################
  # Добавление продукта в корзину и обновление корзины #
  ######################################################
  def order_product_add(product_id, increment, productMeasure, productMeasureSize, measurePrice)
    product = Product.find(product_id)
    if increment.to_f > 0
      increment = increment.to_f
    else
      increment = 1
    end

    product_price = (measurePrice * increment).round(2)
    item = order_items.find_by(product_id: product_id)
    # Ищем переданный продукт в заказе
    if item.blank?
      if product.product_photos.first.present?
        product_photo = product.product_photos.first.photo.thumb
      else
        product_photo = ''
      end
      # если продукта нет, добавляем новый
      order_items.create(product_id: product.id,
                         title: product.title,
                         full_path: product.full_path,
                         price: product_price,
                         origin_price: measurePrice,
                         unit: product.unit,
                         measure_size: productMeasureSize,
                         photo: product_photo,
                         count: increment,
                         measure: productMeasure)
    else
      # если есть, увеличиваем кол-во данной позиции на increment
      item.count = increment
      # если есть, увеличиваем стоимость данной позиции
      item.price = product_price
    end
    update
  end


  def count_items
    order_items.length
  end

  def price
    order_items.sum(:price).round(2)
  end

  def item_delete(product_id)
    product = self.order_items.find_by(product_id: product_id)
    self.order_items.delete(product)
    update
  end

  def status_human
    case self.status
      when 0
        {name: 'Новый', number: 0}
      when 1
        {name: 'Выполнен', number: 1}
    end
  end


  # сериализация корзины
  def cart
    {_id: self.id, count_items: self.count_items, price: self.price, order_items: self.order_items}
  end

  protected

  # инкрементация номера заказа
  def order_number_increment
    last_order = Order.last
    if last_order
      self.number = last_order.number + 1
    end
  end

end