class Product < ApplicationRecord
  belongs_to :client
  # Active Storage用アソシエーション
  has_one_attached :image
  # has_one :top
end
