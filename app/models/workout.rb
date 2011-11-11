class Workout < ActiveRecord::Base
  def tip_of_week
    Time.new(2011, 11, 6)
  end
end
