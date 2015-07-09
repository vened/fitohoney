class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String, default: ""
  field :description, type: String, default: ""


  field :price, type: Float, default: 0.0
  field :price_origin, type: Float, default: 0.0
  field :sale, type: Integer, default: 0


  field :unit, type: String, default: "кг." # единица измерения кол-ва товара 1 - килограмм, 2 - литр, 3 - штука
  field :measure, type: Integer, default: 1 # минимальный объем покупки


  # модификации товара
  field :measure_1, type: Float, default: 0.0 # минимальный объем покупки модификации
  field :measure_1_size, type: Float, default: 0.0
  field :measure_1_origin_price, type: Float, default: 0.0
  field :measure_1_price, type: Float, default: 0.0
  field :measure_2, type: Float, default: 0.0 # минимальный объем покупки модификации
  field :measure_2_size, type: Float, default: 0.0
  field :measure_2_origin_price, type: Float, default: 0.0
  field :measure_2_price, type: Float, default: 0.0
  field :measure_3, type: Float, default: 0.0 # минимальный объем покупки модификации
  field :measure_3_size, type: Float, default: 0.0
  field :measure_3_origin_price, type: Float, default: 0.0
  field :measure_3_price, type: Float, default: 0.0


  field :path, type: String
  field :full_path, type: String


  field :created_at, type: Time
  field :updated_at, type: Time

  embeds_many :product_photos
  embeds_many :properties
  belongs_to :brand
  belongs_to :category, index: true

  index({ path: 1 })
  index "properties.n" => 1
  index "properties.s" => 1
  index "properties.v" => 1


  before_save :product_price, :create_path, :create_full_path


  # транслитерация названия продукта это будет кусочком полного пути к продукту
  # перед транслитерированным названием добавляется полный путь к категории
  # решил попробовать хранить этот путь сразу в поле path чтоб минимизировать запросы к БД
  def create_path
    prepare_title               = self.title.gsub(/\s/, "-")
    prepare_title               = prepare_title.gsub(/[*]/, "x")
    prepare_title               = prepare_title.gsub(/\,/, "")
    prepare_title               = prepare_title.gsub(/\./, "")
    transliterate_prepare_title = I18n.transliterate(prepare_title).downcase
    self.path                   = transliterate_prepare_title
  end


  def create_full_path
    transliterate_prepare_title = self.create_path
    category                    = self.category
    if category.blank?
      full_path = [nil, 'catalog', transliterate_prepare_title]
    else
      full_path = [nil, 'catalog', category.path, transliterate_prepare_title]
    end
    self.full_path = full_path.join('/').gsub(/\/+/, '/')
  end


  protected
  # округление цены до двух знаков после запятой
  def product_price
    self.price_origin.round(2)
    self.price = self.price_origin * (100 - sale)/100
    self.price.round(2)

    if measure_1 > 0
      self.measure_1_price = self.measure_1_origin_price * (100 - sale)/100
      self.measure_1_price.round(2)
    else
      self.measure_1_price = 0
    end
    if measure_2 > 0
      self.measure_2_price = self.measure_2_origin_price * (100 - sale)/100
      self.measure_2_price.round(2)
    else
      self.measure_2_price = 0
    end
    if measure_3 > 0
      self.measure_3_price = self.measure_3_origin_price * (100 - sale)/100
      self.measure_3_price.round(2)
    else
      self.measure_3_price = 0
    end
  end
end