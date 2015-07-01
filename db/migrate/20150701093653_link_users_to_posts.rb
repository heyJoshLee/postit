class LinkUsersToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer # table_name, foreign key, data_type
  end
end
