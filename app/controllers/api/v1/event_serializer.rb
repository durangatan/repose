class Api::V1::EventSerializer < Api::V1::BaseSerializer
  attributes :start_time, :end_time, :latitude, :longitude

  has_many :surveys

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end