class Top < ApplicationRecord
  belongs_to client
  has_one_attached :image
  mount_uploader :video, VideoUploader
end
