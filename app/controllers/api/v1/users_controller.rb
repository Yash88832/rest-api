class Api::V1::UsersController < ApplicationController
	# Get /users 
  def index
    @users = User.all
    render json: @users
  end

  # Get /users/:id
  def show 
    @user = User.find(params[:id])
    render json: @user
  end

  # Post /users
  def create 
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render error: {error: 'unable to create user'}, status: 400
    end
  end

  #Put /users/:id
  def update 
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: {message: 'User was successfully updated'},status: 200
    else
      render error: {error: 'unable to create user'}, status: 400
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user 
      @user.destroy
      render json: {message: 'User was successfully destroy'},status: 200
    else
      render error: {error: 'unable to create user'}, status: 400
    end
  end

  private 

    def user_params
      params.require(:user).permit(:user_name, :password)
    end
end
