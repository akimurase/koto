class CreateTops < ActiveRecord::Migration[6.0]
  def change
    create_table :tops do |t|
      t.string :video_top
      t.string :title
      t.integer :client_id

      t.timestamps
    end
  end
end
