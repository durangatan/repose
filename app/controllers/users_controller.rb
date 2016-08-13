class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    if request.xhr?
      chart_data = []

      @user.events.each do |entry|
        data_point = []
        data_point.push(entry.start_time)
        data_point.push(entry.survey.severity)
        chart_data.push(data_point)
      end
      p chart_data
      render json: chart_data
    else
      render 'show'
    end
  end
end
