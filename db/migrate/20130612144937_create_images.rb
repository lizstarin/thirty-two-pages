class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :file
      t.integer :project_id

      t.timestamps
    end
  end
end
