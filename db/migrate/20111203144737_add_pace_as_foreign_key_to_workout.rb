class AddPaceAsForeignKeyToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :pace_id, :integer
  end
end
