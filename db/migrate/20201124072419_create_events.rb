class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string    :user_name
      t.string    :user_kana
      t.string    :user_email
      t.string    :user_tel
      t.string    :product_name

      t.string    :price
      t.integer   :num_id
      t.datetime  :start_time
      t.integer   :user_id
      t.integer   :product_id
      t.integer   :client_id

      t.timestamps
    end
  end
end
