class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String, default: ""
  field :description, type: String, default: ""
  field :price, type: Float, default: 0.0

  field :parent_id, type: BSON::ObjectId, default: nil

  field :path, type: String
  field :full_path, type: String

  field :created_at, type: Time
  field :updated_at, type: Time

  embeds_many :product_photos
  embeds_many :properties
  embeds_many :nested_products
  belongs_to :brand
  belongs_to :category, index: true

  index({ path: 1 })
  index "properties.n" => 1
  index "properties.s" => 1
  index "properties.v" => 1


  before_save :product_price, :create_path, :create_full_path

  ##################################################################
  # begin вложенные продукты
  # добавление в массив :nested_products id связанного продукта
  # в связанном продукте добавляем :parent_id родительского продукта
  def create_nested_products(product, group_title)

    group = self.nested_products.find_by(title: group_title)

    if group.blank?
      self.nested_products.create(title: group_title, products: [product.id])
    else
      group.products << product.id
    end
    # 
    # group[:group] = 'Базовая плитка'
    # group[:products].push product.id
    # 
    # self.nested_products.push group
    self.save!
    product.parent_id = self.id
    product.save!
  end


  def find_nested_products
    if self.nested_products.present?
      Product.find(self.nested_products)
    else
      []
    end
  end


  def destroy_nested_product nested_product
    if self.nested_products.include?(nested_product.id)
      self.nested_products.delete(nested_product.id)
      nested_product.parent_id = nil
      self.save!
      nested_product.save!
    else
      []
    end
  end


  # end вложенные продукты
  ##################################################################


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
    price.round(2)
  end
end