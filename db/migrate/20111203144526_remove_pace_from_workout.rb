class RemovePaceFromWorkout < ActiveRecord::Migration
  def change
    remove_column :workouts, :pace
  end
end
