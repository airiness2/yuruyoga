include Cloudinary::CarrierWave if Rails.env.production?

CarrierWave.configure do |config|
  config.cache_storage = :file
end
