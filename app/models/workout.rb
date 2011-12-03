class Workout < ActiveRecord::Base
  has_one :duration
  after_initialize :init
  
  def init
    self.duration ||= Duration.new
  end
  
  def long_hash
    Digest::SHA1.hexdigest(self.id.to_s)
  end
end
