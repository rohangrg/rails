class Post < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  def image_url
    "/uploads/#{id}/#{image.file.filename}"
  end
end
