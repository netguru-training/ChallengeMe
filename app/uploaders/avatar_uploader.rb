# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  # Use Heroku's temp folder for uploads
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  process :resize_to_fit => [600, 600]

  version :tiny_thumb do
    process :resize_to_fill => [50, 50]
  end

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
     'http://www.legendarysaga.com/wp-content/uploads/2013/03/avatar-empty.gif'
  end
end
