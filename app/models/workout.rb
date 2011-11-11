class Workout < ActiveRecord::Base
  def tip_of_week
    as_date_time = DateTime.new(self.when.year, self.when.month, self.when.day)
    tip = as_date_time - as_date_time.wday
    
    return DateTime.new(tip.year, tip.month, tip.day)
  end
end
