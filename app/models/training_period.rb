class TrainingPeriod
  include Enumerable
  
  def initialize user_id, starting_date
    @user_id = user_id
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
      day_info = { :node => day,
                   :date => current_day,
                   :formatted => formatted_date(current_day),
                   :week_day => formatted_day(current_day),
                   :workouts => retrieve_workouts(current_day)
                 }
      yield day_info

      current_day = current_day.tomorrow
    end
  end

  def formatted_date day
    day.strftime("%m/%d/%Y")
  end

  def formatted_day day
    day.strftime("%a")
  end

  def formatted_tip_of_week
    tip_of_week.strftime("%B %d, %Y")
  end

  def retrieve_workouts day
    Workout.where :user_id => @user_id, :when => day.in_time_zone
  end
end
