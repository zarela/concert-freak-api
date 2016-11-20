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
    # data = HTTParty.get('https://app.ticketmaster.com/discovery/v2/events.json?apikey=A3xk5YLy7A8prLuAuEW5cMALOkpbEzPe')
    # render json: data

    events = Event.all
    render json: events
  end

  def create
    event = Event.new(event_params)
    # event.user_id = @user.id
    # puts(event_params)
    if event.save
      render json: {status: 200, message: 'Created a new event'}
    else
      render json: {status: 422, event: event, errors: event.errors }
      # render json: event.errors, status :unprocessable_entity
    end
  end

  def show

    # This works
    event = Event.find(params[:id])
    render json :event

    # event = Event.includes(:venue).find(params[:id])
    # venue = event.venue

    # render json: {status: 200, event: event, venue: venue}

  end

  private

    def event_params
      params.require(:event).permit(:artist, :date, :price, :url, :location)
    end

end
