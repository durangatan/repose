class Survey < ApplicationRecord
belongs_to :event

validates_presence_of :severity
validates_uniqueness_of :event_id
validates :severity, numericality: true

end
