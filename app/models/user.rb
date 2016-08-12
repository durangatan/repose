class User < ApplicationRecord
  include Clearance::User
  has_many :events
  has_many :surveys, through: :events

  has_many :lifelines
  has_many :availabilities, through: :lifelines

end
