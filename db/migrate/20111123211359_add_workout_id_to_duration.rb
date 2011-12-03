class AddWorkoutIdToDuration < ActiveRecord::Migration
  def change
    add_column :durations, :workout_id, :integer
  end
end
