# encoding: utf-8

class CarouselUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [250, 100]
    process :quality => 80
  end

  version :carousel do
    process :resize_to_fill => [1200, 500]
    process :quality => 80
  end

  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage.to_s)
      img = yield(img) if block_given?
      img
    end
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
