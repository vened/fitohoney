class Brand
  include Mongoid::Document
  field :title, type: String
  field :path, type: String
  field :photo, type: String

  
  has_many :products

  mount_uploader :photo, BrandUploader
end