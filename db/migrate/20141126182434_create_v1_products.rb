class CreateV1Products < ActiveRecord::Migration
  def change
    create_table :v1_products do |t|
      t.string :name
      t.decimal :net_price, precision: 8, scale: 2
      t.integer :item_line_id
      t.timestamps
    end
  end
end
