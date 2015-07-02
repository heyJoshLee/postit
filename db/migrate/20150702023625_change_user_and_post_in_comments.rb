class ChangeUserAndPostInComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user
    remove_column :comments, :post
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
  end
end
