class Workout < ActiveRecord::Base
  def tip_of_week
    as_date_time = DateTime.new(self.when.year, self.when.month, self.when.day)
    return as_date_time - as_date_time.wday
  end
end
