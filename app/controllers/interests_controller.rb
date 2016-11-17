class InterestsController < ApplicationController
  def get_all
    users = User.all
    interests = Interest.all
    events = Event.all
    all_data = {events: events, users: users, interests: interests}
    render json: all_data
  end

  def index
    interests = Interest.all
    render json: interests
  end

  def show
    interest = Interest.find(params[:id])
    render json: interest
  end

  def create
    interest = Interest.new(interest_params)
    puts(interest_params)

    if interest.save
      render json: interest, status: :created
    else
      render json: interest.errors, status: :unprocessable_entity
    end
  end

  def destroy
    interest = Interest.find(params[:id])
    interest.destroy
    render json: {status: 204}
  end

  private
  def interest_params
    params.require(:interest).permit(:rsvp, :user_id, :event_id)
  end
end
