CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.S3[:access_key_id],
    aws_secret_access_key: Settings.S3[:secret_access_key],
    region: Settings.S3[:region]
  }

    case Rails.env
    when 'development'
        config.fog_directory  = Settings.S3[:directory]
        config.asset_host = Settings.S3[:asset_host]
    when 'production'
        config.fog_directory  = Settings.S3[:directory]
        config.asset_host = Settings.S3[:asset_host]
    end
    when 'test'
        config.storage = :file
    end
end
