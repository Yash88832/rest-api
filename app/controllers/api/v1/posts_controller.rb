class Api::V1::PostsController < ApplicationController
  before_action :find_post, only:[:show, :update, :destroy]
	# Get /posts 
  def index
    @posts = Post.all
    render json: @posts
  end

  # Get /posts/:id
  def show 
    render json: @post
  end

  # Post /posts
  def create 
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render error: {error: 'unable to create post'}, status: 400
    end
  end

  #Put /posts/:id
  def update 
    if @post
      @post.update(post_params)
      render json: {message: 'post was successfully updated'},status: 200
    else
      render error: {error: 'unable to create post'}, status: 400
    end
  end

  def destroy
    if @post 
      @post.destroy
      render json: {message: 'post was successfully destroy'},status: 200
    else
      render error: {error: 'unable to create post'}, status: 400
    end
  end

  private 

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :likes, :user_id)
    end
end
