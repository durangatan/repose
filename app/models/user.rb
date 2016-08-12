class User < ApplicationRecord
  include Clearance::User
  has_many :events
  has_many :surveys, through: :events

  has_many :lifelines
  has_many :availabilities, through: :lifelines

  validates_uniqueness_of :email
  validates :email, format: {with: /\S+@\S/}
  validates_presence_of :first_name
  validates_presence_of :last_name
end
