class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.string  :title
      t.string  :text
      t.integer :product_id

      t.timestamps
    end
  end
end
