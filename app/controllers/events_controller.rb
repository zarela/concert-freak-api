class EventsController < ApplicationController

  def index
    data = HTTParty.get(https://app.ticketmaster.com/discovery/v2/events.json?apikey=A3xk5YLy7A8prLuAuEW5cMALOkpbEzPe)
    render json: data
    # events = Event.all
    # render json: events
  end

  def show
    event = Event.find(params[:id])
    render json :event
  end

  def create
    event = Event.new(event_params)
    puts(event_params)

    if event.save
      render json: event, status: :created
    else
      render json: event.errors, status :unprocessable_entity
    end
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
    event = Event.find(params[:id])
    event.destroy
    render json: {status: 204}
  end

  private

    def event_params
      params.require(:event).permit(:artist, :venue_id, :date, :ticket_price, :concert_url)
    end

end
