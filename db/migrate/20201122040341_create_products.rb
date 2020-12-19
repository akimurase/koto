class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name
      t.text    :text
      t.string  :title
      t.integer :price
      t.string  :unit
      t.integer :client_id

      t.timestamps
    end
  end
end
