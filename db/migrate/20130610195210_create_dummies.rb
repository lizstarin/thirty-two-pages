class CreateDummies < ActiveRecord::Migration
  def change
    create_table :dummies do |t|
      t.integer :project_id
      t.integer :page_count
      t.boolean :self_ends
      t.integer :trim_width
      t.integer :trim_height

      t.timestamps
    end
  end
end
