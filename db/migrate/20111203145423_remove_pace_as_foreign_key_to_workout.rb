class RemovePaceAsForeignKeyToWorkout < ActiveRecord::Migration
  def up
    remove_column :workouts, :pace_id
  end

  def down
    add_column :workouts, :pace_id, :integer
  end
end
