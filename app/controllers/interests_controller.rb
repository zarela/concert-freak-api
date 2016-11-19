class InterestsController < ApplicationController
  # before_action :authenticate

  def set_users
    @user = User.find(params[:user_id])
  end

  def get_all
    users = User.all
    interests = Interest.all
    events = Event.all
    venue = Venue.all
    all_data = {events: events, users: users, interests: interests, venues: venues}
    render json: all_data
  end

  def index
    interests = User.find(params[:user_id]).interests
    render json: interests
  end

  def show
    interest = Interest.find(params[:id])
    render json: interest
  end

  def create
    interest = Interest.new(interest_params)
    # interest.user_id = @user.id

    if interest.save

      render json: {status: 200, message: 'Interested in this event'}
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
