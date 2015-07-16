class CategoriesController < ApplicationController
  before_action :require_user, only: [:new, :create]

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
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  
  end


  def post_params
      params.require(:category).permit!
  end

end