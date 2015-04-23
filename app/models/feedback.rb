class Feedback
  include Mongoid::Document
  field :title, type: String
  field :prev, type: String
  field :body, type: String
  field :photo, type: String

  mount_uploader :photo, FeedbackUploader
end