class AddSelfEndsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :self_ends, :boolean
  end
end
