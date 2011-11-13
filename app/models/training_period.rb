class TrainingPeriod
  def initialize starting_date
    @starting_date = starting_date.in_time_zone('UTC')
  end
  
  def tip_of_week
    return @starting_date.time - @starting_date.time.wday
  end
end
