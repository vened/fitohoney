# encoding: utf-8

class FeedbackUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    process :resize_to_fill => [400, 500]
  end


  def extension_white_list
    %w(jpg jpeg png)
  end

end
