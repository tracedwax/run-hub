class Workout < ActiveRecord::Base
  def tip_of_week
    return self.when.time - self.when.time.wday
  end
end
