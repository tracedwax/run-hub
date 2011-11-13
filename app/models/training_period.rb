class TrainingPeriod
  def initialize starting_date
    @starting_date = starting_date
  end
  
  def tip_of_week
    return @starting_date.time - @starting_date.time.wday
  end
end
