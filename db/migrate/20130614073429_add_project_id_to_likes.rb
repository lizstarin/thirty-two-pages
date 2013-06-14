class AddProjectIdToLikes < ActiveRecord::Migration
  def change
		add_column :likes, :project_id, :integer
  end
end
