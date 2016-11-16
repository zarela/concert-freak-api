class UsersController < ApplicationController
  before_action :authenticate, except: [:login, :create]

  def index
    users = User.all
    render json: users
  end

  #POST/users
  def create
    user = User.new(user_params)

    if user.save
      render json: {status: 200, message: "ok"}
    else
      render json: {status: 422, user: user, errors: user.errors }
    end
  end

  def login
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.username) # Added this
      render json: {status: 201, user: user, token: token}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {status: 200, user: user}
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    User.destroy(params[:id])

    render json: { status: 204 }
  end

  private

  def token(id, username)
    # binding.pry
    puts payload(id, username)
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload(id, username)
    {
      exp: (Time.now + 1.day).to_i, # Expiration date 24 hours from now
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
  end

  def user_params
    params.required(:user).permit(:username, :password, :email)
  end

end
