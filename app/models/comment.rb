class Comment < ActiveRecord::Base
  include Voteable

  belongs_to :user
  belongs_to :post

  validates :body, presence: true


  
end