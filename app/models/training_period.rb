class TrainingPeriod
  def initialize starting_date
    @starting_date = starting_date
  end

  def self.parse_date date
    month, day, year = date.split(/-/).map do |element| element.to_i end
    return DateTime.new(year, month, day).in_time_zone
  end
  
  def tip_of_week
    return @starting_date.time - @starting_date.time.wday
  end
end
