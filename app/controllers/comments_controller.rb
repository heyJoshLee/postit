class CommentsController < ApplicationController 

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
    Vote.create(voteable: comment, creator: current_user, vote: params[:vote])
    flash[:notice] = "Your vote was counted"
    redirect_to :back
  end

end