class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :prev, type: String
  field :body, type: String
  field :photo, type: String
  field :created_at, type: Time
  field :updated_at, type: Time


  mount_uploader :photo, FeedbackUploader
end