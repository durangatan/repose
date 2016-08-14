class Api::V1::UserSerializer < Api::V1::BaseSerializer
	attributes :email, :first_name, :last_name, :bearer_token, :created_at, :updated_at

	has_many :events
	has_many :lifelines

	def created_at
	  object.created_at.in_time_zone.iso8601 if object.created_at
	end

	def updated_at
	  object.updated_at.in_time_zone.iso8601 if object.created_at
	end
end