class CreateDurations < ActiveRecord::Migration
  def change
    create_table :durations do |t|
      t.integer :hours,   :default => 0
      t.integer :minutes, :default => 0
      t.integer :seconds, :default => 0

      t.timestamps
    end
  end
end
