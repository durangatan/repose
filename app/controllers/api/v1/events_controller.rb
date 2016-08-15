class Api::V1::EventsController < Api::V1::BaseController 

  def create
    @user = User.find_by!(bearer_token:params[:bearer_token][0])
    if @user
      event = @user.Event.create!(
        start_time:params[:event][0], 
        end_time:params[:event][1]
        )
    end
    survey = params[:survey][0]
    if survey
      event.Survey.create!{
        severity:survey[:severity],
        sleep_quality: survey[:sleep_quality],
        comments:survey[:comments],
        causation: survey[:causation]
      }
    end
  end

end