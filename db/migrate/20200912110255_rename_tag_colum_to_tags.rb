class RenameTagColumToTags < ActiveRecord::Migration[5.2]
  def change
  	rename_column :tags, :tag, :hashname
  end
end
