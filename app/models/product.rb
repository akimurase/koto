class Product < ApplicationRecord
  belongs_to :client
  has_many :point
  # Active Storage用アソシエーション
  has_one_attached :image
end
