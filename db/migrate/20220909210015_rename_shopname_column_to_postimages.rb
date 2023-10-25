class RenameShopnameColumnToPostimages < ActiveRecord::Migration[6.1]
  def change
    rename_column :postimages, :shopname, :shop_name
  end
end
