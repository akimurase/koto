class CreateProductes < ActiveRecord::Migration[6.0]
  def change
    create_table :productes do |t|
      t.string :tour_name
      t.text    :text
      t.integer :client_id


      t.timestamps
    end
  end
end
