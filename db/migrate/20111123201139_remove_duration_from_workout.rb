class RemoveDurationFromWorkout < ActiveRecord::Migration
  def change
    remove_column :workouts, :duration
  end
end
