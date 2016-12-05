class Get < ApplicationRecord

  records_with_operator_on :create, :update
 	mount_uploader :getimage, GetimageUploader
end
