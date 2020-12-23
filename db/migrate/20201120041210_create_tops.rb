class CreateTops < ActiveRecord::Migration[6.0]
  def change
    create_table :tops do |t|
      t.string :video_top,   null: false
      t.string :title,       null: false
      t.integer :client_id,  null: false

      t.timestamps
    end
  end
end
