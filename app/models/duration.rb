class Duration < ActiveRecord::Base
  belongs_to :workout
  
  def to_s
    if self.hours > 0
      Time.new(2011, 11, 6, hours, minutes, seconds).strftime("%H:%M:%S")
    else
      Time.new(2011, 11, 6, hours, minutes, seconds).strftime("%M:%S")
    end
  end
end
