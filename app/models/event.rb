class Event < ApplicationRecord
	belongs_to :user
	has_one :survey, dependent: :destroy

  def duration
    ((self.end_time - self.start_time) / 1.minutes).to_i
  end

  def duration_format
  	elapsed = (self.end_time - self.start_time).to_i
    hours = elapsed / 3600
    dt = DateTime.strptime(elapsed.to_s, '%s').utc
    "#{hours}:#{dt.strftime "%M"}"
  end

end
