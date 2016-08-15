class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @events = @user.events
    if request.xhr?
      chart_data = []

      @user.events.each do |entry|
        data_point = []
        data_point.push(entry.start_time)
        data_point.push(entry.survey.severity)
        # COULD WE d3 THE DURATION: MORE DURATION = BIGGER CIRCLE
        # HOVER COULD DISPLAY COMMENTS, OR ACT AS A LINK
        # data_point.push(entry.survey.id)  for linking
        data_point.push(entry.survey.comments)
        data_point.push(entry.duration_format)

        chart_data.push(data_point)
      end
      p chart_data
      render json: chart_data
    else
      render 'show'
    end
  end
end
