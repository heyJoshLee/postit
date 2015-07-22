class CommentsController < ApplicationController 

  before_action :logged_in?, only: [:vote]


  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @user = User.find(session[:user_id]) ## Need to change this later
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit!)
    @comment.user = @user

    if @comment.save 
      redirect_to post_path(@post) 
    else
      render "posts/show"
    end
  end

  def vote


    comment = Comment.find(params[:id])
    vote = Vote.create(voteable: comment, creator: current_user, vote: params[:vote])
    

    if vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "You can only vote once"
    end

    redirect_to :back



  end

end