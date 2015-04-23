class Carousel
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :path, type: String
  field :photo, type: String

  mount_uploader :photo, CarouselUploader
end