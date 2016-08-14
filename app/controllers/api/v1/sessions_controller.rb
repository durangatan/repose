class Api::V1::SessionsController < Api::V1::BaseController 

	def create
		user = User.find_by_email(params[:session][:email])
		if user && authenticate(params)
			token = user.generate_bearer_token
		render json: {bearer_token:token}
		else
			status 400
		end
	end
end