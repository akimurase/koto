class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,       null: false
      t.text    :text
      t.string  :title
      t.string  :price
      t.string  :unit
      t.integer :client_id,  null: false

      t.timestamps
    end
  end
end
