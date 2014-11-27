class CreateV1Users < ActiveRecord::Migration
  def change
    create_table :v1_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
