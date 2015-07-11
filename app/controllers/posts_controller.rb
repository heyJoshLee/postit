class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
  end 

  def update

    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to posts_path
    else
      render :edit
    end

  end

  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
      @post = Post.find(params[:id])
  end


end
