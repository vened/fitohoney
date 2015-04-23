class Property
  include Mongoid::Document
  field :n, as: :name, type: String, default: ""
  field :s, as: :size, type: String, default: ""
  field :v, as: :value, type: String, default: ""
  
  embedded_in :product, inverse_of: :properties
end
