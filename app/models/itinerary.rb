class Itinerary < ApplicationRecord
  belongs_to :product, option: tour
  # Active Storage用アソシエーション
  has_one_attached :image
end
