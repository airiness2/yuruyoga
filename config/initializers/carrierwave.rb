CarrierWave.configure do |config|
  include Cloudinary::CarrierWave if Rails.env.production?
  config.cache_storage = :file
end
