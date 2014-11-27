class CreateV1ApiKeys < ActiveRecord::Migration
  def change
    create_table :v1_api_keys do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
