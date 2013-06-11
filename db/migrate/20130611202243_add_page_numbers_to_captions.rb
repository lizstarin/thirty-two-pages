class AddPageNumbersToCaptions < ActiveRecord::Migration
  def change
    add_column :captions, :page_id, :integer
  end
end
