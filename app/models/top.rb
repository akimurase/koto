class Top < ApplicationRecord
  belongs_to :client, optional: true
  has_many :product  # , dependent: :destroy
  # Active Storage用アソシエーション
  has_one_attached :image
  # career wave用
  mount_uploader :video_top, VideoUploader
  validates :video_top, :client_id, presence: true
end
