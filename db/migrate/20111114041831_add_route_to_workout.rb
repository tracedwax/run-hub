class AddRouteToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :route, :string
  end
end
