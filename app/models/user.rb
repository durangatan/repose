class User < ApplicationRecord

  include Clearance::User
  has_many :events
  has_many :surveys, through: :events

  has_many :lifelines
  has_many :availabilities, through: :lifelines


  def create_bearer_token
    bearer_token ||= SecureRandom.base64(64)
    save
    bearer_token
  end

end