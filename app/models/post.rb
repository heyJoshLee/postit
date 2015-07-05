class Post < ActiveRecord::Base
  belongs_to :users
  has_many :comments
  has_many :post_categories 
  has_many :categories, through: :post_categories
end