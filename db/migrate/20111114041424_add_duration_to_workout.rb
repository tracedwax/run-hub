class AddDurationToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :duration, :string
  end
end
