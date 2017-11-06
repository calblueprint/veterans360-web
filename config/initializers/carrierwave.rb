CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY'),
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    region:                "us-east-1"

  }
  config.fog_directory  = ENV.fetch('S3_BUCKET_NAME')
  config.fog_public     = true
end
