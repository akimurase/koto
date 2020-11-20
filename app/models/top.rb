class Top < ApplicationRecord
  belongs_to client
  mount_uploader :video, VideoUploader
end
