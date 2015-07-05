class ChangePostCategoriesCategoryColumn < ActiveRecord::Migration
  def change
    rename_column :post_categories, :category, :category_id
  end
end
