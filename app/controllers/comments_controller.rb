class CommentsController < ApplicationController 

  def create
    @user = User.first ## Need to change this later
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit!)
    @comment.user = @user

    if @comment.save 
      redirect_to post_path(@post) 
    else
      render "posts/show"
    end
    
  end

end