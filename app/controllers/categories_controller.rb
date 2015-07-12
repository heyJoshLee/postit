class CategoriesController < ActionController::Base

  def index 
    @categories = Category.all
  end

  def show 
    @category = Category.find(params[:id])
    @posts = @category.posts
  end


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(post_params)
  
  end


  def post_params
      params.require(:category).permit!
  end

end