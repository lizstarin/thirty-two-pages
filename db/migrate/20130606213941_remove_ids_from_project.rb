class RemoveIdsFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :manuscript_id
    remove_column :projects, :album_id
  end
end
