class VenuesController < ApplicationController
  def index
    venues = Venue.all
    render json: venues
  end

  def show
    venue = Venue.find(params[:id])
    render json: venue
  end

  private
    def venue_params
      params.require(:venue).permit(:address, :venue_name, :city, :state, :zipcode)
    end

end
