class CreateWindows < ActiveRecord::Migration
  def change
    create_table :windows do |t|
      t.integer :event_id
      t.datetime :start_time
      t.integer :duration
      t.integer :capacity

      t.timestamps
    end
  end
end
