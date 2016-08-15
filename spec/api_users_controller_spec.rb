require "rails_helper"
RSpec.describe Api::V1::UsersController, type: :controller do 
  describe "POST /users" do 
    it "creates a new user object " do 
      expect "response".to have_http_status 200
    end
  end
end