class CreateProductes < ActiveRecord::Migration[6.0]
  def change
    create_table :productes do |t|

      t.timestamps
    end
  end
end
