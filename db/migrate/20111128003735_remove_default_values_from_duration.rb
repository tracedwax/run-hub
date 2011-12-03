class RemoveDefaultValuesFromDuration < ActiveRecord::Migration
  def change
    change_column_default :durations, :hours, nil
    change_column_default :durations, :minutes, nil
    change_column_default :durations, :seconds, nil
  end
end
