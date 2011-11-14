class AddDistanceToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :distance, :float
  end
end
