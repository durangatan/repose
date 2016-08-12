class Lifeline < ApplicationRecord
belongs_to :user
has_many :availabilities, dependent: :destroy

validates_presence_of :first_name
validates_presence_of :last_name
validates_presence_of :phone
validates_presence_of :user_id
validates :user_id, numericality:  true
end
