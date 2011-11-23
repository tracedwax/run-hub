class Duration < ActiveRecord::Base
  belongs_to :workout
  
  def to_s
    self.hours.to_s + ":" + self.minutes.to_s + ":" + self.seconds.to_s
  end
end
