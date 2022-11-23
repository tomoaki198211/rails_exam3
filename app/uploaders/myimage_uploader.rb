class MyimageUploader < CarrierWave::Uploader::Base

  storage :file
  # process resize_to_limit: [500,500]
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
