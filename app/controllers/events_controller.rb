class EventsController < ApplicationController
  before_action :set_users, only: [:create, :index, :destroy, :show]

  def set_users
    @user = User.find(params[:user_id])
  end

  def index
    # data = HTTParty.get('https://app.ticketmaster.com/discovery/v2/events.json?apikey=A3xk5YLy7A8prLuAuEW5cMALOkpbEzPe')
    # render json: data

    events = @user.events
    render json: {status: 200, events: events}

    # events = Event.all
    # render json: events
  end

  def create
    event = Event.new(event_params)
    event.user_id = @user.id
    # puts(event_params)
    if event.save
      render json: {status: 200, message: 'Created a new event'}
    else
      render json: {status: 422, event: events, errors: event.errors }
      # render json: event.errors, status :unprocessable_entity
    end
  end

  def show
    event = @user.event.find(params[:id])
    render json: {status: 200, event: event}
    # event = Event.find(params[:id])
    # render json :event
  end


  # def update
  #   event = Event.find(params[:id])
  #   if event.update(event_params)
  #     render json: event
  #   else
  #     render json: event.errors, status: :unprocessable_entity
  #   end
  # end

  def destroy
    Event.destroy(params[:id])
    render json: {status: 204}
  end

  private

    def event_params
      params.require(:event).permit(:artist, :venue_id, :date, :ticket_price, :concert_url)
    end

end
