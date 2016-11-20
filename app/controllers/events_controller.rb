class EventsController < ApplicationController
  # before_action :set_users, only: [:create]
  #
  # def set_users
  #   @user = User.find(params[:user_id])
  # end

  def get_all
    events = Event.all
    venue = Venue.all

    all_data = {events: events, venues: venues}
    render json: all_data
  end

  def index
    events = Event.all
    render json: events
  end

  def create
    event = Event.new(event_params)
    # event.user_id = @user.id
    if event.save
      render json: {status: 200, message: 'Created a new event'}
    else
      render json: {status: 422, event: event, errors: event.errors }
    end
  end

  def show
    event = Event.find(params[:id])
    render json :event
  end

  private

    def event_params
      params.require(:event).permit(:artist, :date, :price, :url, :location)
    end

end
