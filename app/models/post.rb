class Post < ActiveRecord::Base
  include Voteable
  include Slugable


  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories 
  has_many :categories, through: :post_categories


  
  validates :title, :url, presence: true
  validates :title, length: {minimum: 2, maximum: 140}
  validates :description, length: {maximum: 1000}
  validates :url, length: {minimum: 2}

  slugable_column :title


end