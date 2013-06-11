class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :page_count, :integer
    add_column :projects, :trim_width, :integer
    add_column :projects, :trim_height, :integer
  end
end
