class AddTimeStampsToPostsUsersCommentsCategories < ActiveRecord::Migration
  def change
        add_timestamps(:users)
        add_timestamps(:categories)
        add_timestamps(:comments)
        add_timestamps(:posts)
  end
end
