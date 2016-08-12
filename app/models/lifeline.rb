class Lifeline < ApplicationRecord
belongs_to :user
has_many :availabilities
end
