class RemoveDummyIdFromCaption < ActiveRecord::Migration
  def change
    remove_column :captions, :dummy_id
  end
end
