class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.integer :capacity
      t.string :title

      t.timestamps
    end
  end
end
