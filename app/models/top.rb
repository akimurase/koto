class Top < ApplicationRecord
  belongs_to :client
  # Active Storage用アソシエーション
  has_one_attached :image
  # career wave用
  mount_uploader :video_top, VideoUploader
end
