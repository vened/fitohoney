class NestedProduct
  include Mongoid::Document
  field :title, type: String, default: ''
  field :products, type: Array, default: []

  embedded_in :product
end