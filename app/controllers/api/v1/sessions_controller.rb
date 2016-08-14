class Api::V1::SessionsController < Api::V1::BaseController 

	def create
		user = user.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			token = user.generate_bearer_token
		render json: {bearer_token:token}
		else
			status 400
		end
	end
end