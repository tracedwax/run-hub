class AddPaceToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :pace, :string
  end
end
