class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |f|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :manuscript_id
      t.integer :album_id
      t.boolean :public

      t.timestamps
    end
  end
end
