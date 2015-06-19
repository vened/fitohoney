class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :path, type: String
  field :prev, type: String
  field :body, type: String
  field :photo, type: String
  field :created_at, type: Time
  field :updated_at, type: Time


  mount_uploader :photo, ProductPhotosUploader

  before_save :create_path
  
  paginates_per 10

  def create_path
    self.path = self.title.parameterize
  end

end