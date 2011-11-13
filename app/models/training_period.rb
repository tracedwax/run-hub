class TrainingPeriod
  include Enumerable
  
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

  def each
    current_day = tip_of_week

    (1..7).each do |day|
      day_info = { :node => day, :date => current_day }
      yield day_info

      current_day = current_day.tomorrow
    end
  end
end
