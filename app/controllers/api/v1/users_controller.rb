class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all
    render json: users, status: :ok
  end


  def create
    user = User.new user_params

    if user.save
      render json: { message: 'Success', user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, root: false, status: :bad_request
    end
  end

  def update
    updated_user = user_params

    if user
      user.update updated_user

      render json: user, status: :ok
    else
      render json: { errors: user.errors.full_messages }, root: false, status: :bad_request
    end
  end

  def destroy
    if user
      user.destroy
      render json: { message: 'Successfully deleted the user' }, status: :ok
    else
      render json: { error: "User with id #{params[:id]} doesn't exists" }, status: :not_found
    end
  end

  def user
    User.find_by id: params[:id]
  end

  private

  def user_params
    permitted = params.require(:user).permit(:first_name, :last_name, :age, :address)
  end

end
