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


  def create_path
    prepare_title               = self.title.gsub(/\s/, "-")
    prepare_title               = prepare_title.gsub(/[*]/, "x")
    prepare_title               = prepare_title.gsub(/\,/, "")
    prepare_title               = prepare_title.gsub(/\./, "")
    prepare_title               = prepare_title.gsub(/\!/, "")
    transliterate_prepare_title = I18n.transliterate(prepare_title).downcase
    self.path                   = transliterate_prepare_title
  end


end