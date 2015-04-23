# encoding: utf-8

class ProductPhotosUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [250, 250]
  end
  version :large do
    process :resize_to_limit => [1000, 1000]
  end


end
