class CreateDemos < ActiveRecord::Migration[6.0]
  def change
    create_table :demos do |t|
      t.string     :sample_name
      t.string     :sample_kana
      t.string     :sample_email
      t.string     :sample_tel
      t.string     :sample_product_name
      t.string     :price
      t.integer    :num_id
      t.datetime   :start_time
      # t.date       :start_time
      t.integer    :sample_id,                  null: false

      t.timestamps
    end
  end
end
