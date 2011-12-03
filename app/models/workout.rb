class Workout < ActiveRecord::Base
  has_one :duration
  has_one :pace, :class_name => "Duration", :foreign_key => "pace_id"

  after_initialize :init
  
  def init
    self.duration ||= Duration.new
    self.pace ||= Duration.new
  end
  
  def long_hash
    Digest::SHA1.hexdigest(self.id.to_s)
  end
end
