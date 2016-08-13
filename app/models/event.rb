class Event < ApplicationRecord
	belongs_to :user
	has_one :survey, dependent: :destroy

  def duration
    ((self.end_time - self.start_time) / 1.minutes).to_i
    # MAY NEED TO WRITE THIS METHOD OURSELF
    # distance_of_time_in_words(self.end_time, self.start_time)
  end

end
