require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  #if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
  #  config.storage = :file
  #elsif Rails.env.production? #本番はS3に保存する
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'hontobutai' # 作成したバケット名を記述
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'], # 環境変数
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # 環境変数
      region: 'ap-northeast-1',   # アジアパシフィック(東京)を選択した場合
      path_style: true
    }
  #end
end