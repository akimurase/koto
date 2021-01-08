class Product < ApplicationRecord
  belongs_to :client, optional: true
  has_many :point, dependent: :destroy
  has_many :itinerarys, dependent: :destroy
  # cocoonで子フォームを親と一緒に保存するための記述。
  accepts_nested_attributes_for :itinerarys, allow_destroy: true
  # Active Storage用アソシエーション
  has_one_attached :image
  validates :image, :name, :price, :unit, presence: true
end
