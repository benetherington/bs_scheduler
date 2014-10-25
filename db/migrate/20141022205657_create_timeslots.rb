class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :window_id
      t.integer :user_id

      t.timestamps
    end
  end
end
