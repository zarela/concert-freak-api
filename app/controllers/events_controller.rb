class EventsController < ApplicationController
 # before_action :authenticate
  #
  # def set_users
  #   @user = User.find(params[:user_id])
  # end

  # def set_events
  #   @event = Event.find(params[:id])
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
    render json: Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render json: event
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    render json: {status: 204, message: 'Deleted Event'}
  end

  private

    def event_params
      params.required(:event).permit(:artist, :date, :price, :url, :location)
    end

end
