class Itinerary < ApplicationRecord
  belongs_to :product, optional: true
  # Active Storage用アソシエーション
  has_one_attached :image
end
