class Point < ApplicationRecord
  belongs_to :products, optional: true
  # Active Storage用アソシエーション
  has_one_attached :image
end
