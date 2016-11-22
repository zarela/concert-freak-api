class RsvpsController < ApplicationController
  # before_action :authenticate
    def get_all
     users = User.all
     rsvps = Rsvp.all
     events = Event.all

     all_data = {events: events, users: users, rsvps: rsvps}
     render json: all_data
    end

    def index
      rsvps = User.find(params[:user_id]).rsvps
      render json: rsvps
    end

    def show
      rsvp = Rsvp.find(params[:id])
      render json: rsvp
    end

    def create
      # rsvp = Rsvp.new(rsvp_params)
      rsvp = User.find(params[:user_id]).rsvps.create(rsvp_params)
      render json: {status: 201, data: rsvp}

      # if rsvp.save
      #   render json: {status: 200, message: 'You just RSVP for this Event'}
      # else
      #   render json: rsvp.errors, status: :unprocessable_entity
      # end
    end

    def destroy
      rsvp = Rsvp.find(params[:id])
      rsvp.destroy
      render json: {status: 204, message: 'Deleted RSVP'}
    end

    private
      def rsvp_params
        params.require(:rsvp).permit(:user_id, :event_id)
      end
end
