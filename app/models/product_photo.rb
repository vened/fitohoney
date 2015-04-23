class ProductPhoto
  include Mongoid::Document
  field :photo, type: String

  embedded_in :product
  mount_uploader :photo, ProductPhotosUploader
end