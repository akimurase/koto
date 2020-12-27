class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string     :time
      t.string     :title
      t.text       :text
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
