CarrierWave.configure do |config|
  if Rails.env.production?
    include Cloudinary::CarrierWave
    config.cache_storage = :file
  else
    config.storage = :file
  end
end
