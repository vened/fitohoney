class Filter
  include Mongoid::Document
  field :name, type: String, default: ""
  field :size, type: String, default: ""
  field :value, type: Array, default: []

  # embedded_in :category, inverse_of: :filters
end
