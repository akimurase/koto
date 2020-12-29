class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string     :user_name
      t.string     :user_kana
      t.string     :user_email
      t.string     :user_tel
      t.string     :product_name
      t.string     :price
      t.integer    :num_id
      t.datetime   :start_time
      # t.references :user,        null: false, foreign_key: true
      t.string :user_id,        null: false
      t.references :product,     null: false, foreign_key: true
      t.references :client,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
