class Api::V1::EventsController < Api::V1::BaseController 

  def create
    user = User.find_by(bearer_token: params[:bearer_token][0])
    if user
      event = user.events.create!(
        start_time:params[:event][0], 
        end_time:params[:event][1]
        )
    end
    survey = params[:survey][0]
    if survey
      Survey.create(
        severity: survey[:severity],
        sleep_quality: survey[:sleep_quality][0],
        comments: survey[:comments],
        causation: survey[:causation],
        event_id: event.id
      )
    end
  end

  def index
    user = User.find_by(params[:id])
    events = user.events
    event_json = events.map do |event|
      Api::V1::EventSerializer.new(event).to_json
    end
    render json: event_json
  end
end