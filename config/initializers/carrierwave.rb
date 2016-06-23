CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: s3.access_key,
    aws_secret_access_key: s3.secret_access_key,
    region: s3.region
  }

    case Rails.env
    when 'development'
        config.fog_directory  = s3.directory
        config.asset_host = s3.asset_host
    end
    when 'production'
        config.fog_directory  = s3.directory
        config.asset_host = s3.asset_host
    end
    when 'test'
        config.storage = :file
    end
end
