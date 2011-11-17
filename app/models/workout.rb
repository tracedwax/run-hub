class Workout < ActiveRecord::Base
  def long_hash
    Digest::SHA1.hexdigest(self.id.to_s)
  end
end
