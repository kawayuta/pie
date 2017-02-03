# encoding: utf-8

class GetimageUploader < CarrierWave::Uploader::Base

 # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

 # 画像の上限を200pxにする
   process :resize_to_limit => [600, 600]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
   version :thumb do
     process :resize_to_fill => [600, 600, gravity = ::Magick::CenterGravity]
   end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

 # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
 def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end


end# encoding: utf-8
