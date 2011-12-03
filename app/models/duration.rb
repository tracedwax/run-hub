class Duration < ActiveRecord::Base
  belongs_to :workout
  
  def to_s
    if any_values_are_nil?
      if all_values_are_nil?
        ""
      else
        Time.new(2011, 11, 6, hours, minutes, seconds).strftime("%H:%M:%S")
      end
    else
      if self.hours > 0
        Time.new(2011, 11, 6, hours, minutes, seconds).strftime("%H:%M:%S")
      else
        Time.new(2011, 11, 6, hours, minutes, seconds).strftime("%M:%S")
      end
    end
  end

  def any_values_are_nil?
    self.hours.nil? || self.minutes.nil? || self.seconds.nil?
  end

  def all_values_are_nil?
    self.hours.nil? && self.minutes.nil? && self.seconds.nil?
  end
end
