class OrderItem
  include Mongoid::Document
  field :product_id, type: String, default: ''
  field :title, type: String, default: ''
  field :full_path, type: String, default: ''
  field :photo, type: String, default: ''
  field :origin_price, type: Float, default: 0.0
  field :price, type: Float, default: 0.0
  field :count, type: Integer, default: 1
  field :measure, type: Float, default: 0.0
  

  embedded_in :order
end