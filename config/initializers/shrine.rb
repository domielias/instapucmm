require "shrine"
require "shrine/storage/s3"
s3_options = { 
  bucket:            ENV['bucket'], # required 
  region:            ENV['region'], # required 
  access_key_id:     ENV['access_key_id'],
  secret_access_key: ENV['secret_access_key'],
}
 
Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options), # temporary 
  store: Shrine::Storage::S3.new(**s3_options),                  # permanent 
}
Shrine.plugin :mongoid
