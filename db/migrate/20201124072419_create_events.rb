class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime  :start_time
      t.integer   :num_id
      t.integer   :user_id
      t.integer   :product_id

      t.timestamps
    end
  end
end
