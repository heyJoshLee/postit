class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :logged_in?, except: [:index, :show]
  before_action :require_user, except: [:index, :show]
  def index
    @posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    redirect_to root_path unless logged_in?
    @post = Post.new    
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
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

  def vote
    vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "You can only vote once"
    end

    redirect_to :back
  end



  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
      @post = Post.find(params[:id])
  end


end
