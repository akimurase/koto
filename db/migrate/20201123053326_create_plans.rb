class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string  :title
      t.string  :text
      t.integer :image_id
      t.integer :point_id
      t.integer :itinerary_id
      t.string  :price
      t.string  :nuit
      t.integer :product_id
      t.integer :client_id

      t.timestamps
    end
  end
end
