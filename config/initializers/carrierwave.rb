CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider:             'AWS',
      aws_access_key_id:     ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
    }
    config.fog_directory  = "pourpedal_#{Rails.env}"
  else
    config.storage = :file
    config.store_dir = "uploads/#{Rails.env}"
    config.enable_processing = Rails.env.development?
  end
end