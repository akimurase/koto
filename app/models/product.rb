class Product < ApplicationRecord
  belongs_to :client
  has_many :point
  has_many :itinerarys #sは必要？ , dependent: :destroy今は必要ない？
  # cocoonで子フォームを親と一緒に保存するための記述。
  accepts_nested_attributes_for :itinerarys, allow_destroy: true
  # Active Storage用アソシエーション
  has_one_attached :image
end
