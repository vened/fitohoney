class Category
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :title, type: String
  field :path, type: String

  has_many :products, dependent: :nullify
  # embeds_many :filters

  index({path: 1})


  # callbacks
  before_save :create_path
  after_update :rebuild_product_path
  before_destroy :rebuild_product_path_category_destroy


  # агрегация фильтров для товаров в текущей категории
  def filter_params
    Product.collection.aggregate([
                                     # выбираем все товары принадлежащие категории
                                     {
                                         '$match' => {
                                             category_id: self.id
                                         },
                                     },
                                     # разворачиваем массив товаров, в каждом товаре содержится одно свойство
                                     {'$unwind' => '$properties'},
                                     # группировка итогового объекта, группирую по названию фильтра
                                     {
                                         '$group' => {
                                             '_id' => '$properties.n',
                                             'values' => {'$addToSet' => '$properties.v'},
                                             'size' => {'$first' => '$properties.s'}
                                         }
                                     }
                                 ]
    )
  end


  # фильтрация товаров в категории принимает на вход :params
  # {\"2\":{\"name\":\"Страна\",\"value\":\"Сенегал\"}}
  def filtering (params)
    @products = self.products
    params_filter = ActiveSupport::JSON.decode(params)
    search_params = params_filter.map do |param|
      if param[1]['value'].present?
        {'$elemMatch' => {n: param[1]['name'], v: param[1]['value']}}
      end
    end
    @products.where(properties: {'$all' => search_params.compact})
  end


  protected
  # транслитерация названия категории и сохранение значения в поле path
  def create_path
    text = self.title.gsub(/\s+/, "-")
    text = text.gsub(/[*]/, "x")
    self.path = I18n.transliterate(text).downcase
  end


  # перестройка path у продуктов категории при изменении path категории
  def rebuild_product_path
    products.each do |product|
      product.update
    end
  end


  # перестройка path у продуктов категории при изменении path категории
  # костыль self.update(title: '') при удалении категории вначале обнуляем её title чтоб вызвать колбэки 
  # на связанных продуктах и обновить их пути
  def rebuild_product_path_category_destroy
    self.update(title: '')
    products.each do |product|
      product.update(full_path: product.path)
    end
  end


end