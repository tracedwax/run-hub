class AddPaceIdToDuration < ActiveRecord::Migration
  def change
    add_column :durations, :pace_id, :integer
  end
end
