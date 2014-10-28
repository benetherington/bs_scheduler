class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :timestamp_id
      t.datetime :last_pickup

      t.timestamps null: false
    end
  end
end
