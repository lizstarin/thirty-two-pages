class CreateCaptions < ActiveRecord::Migration
  def change
    create_table :captions do |t|
      t.text :content
      t.integer :dummy_id

      t.timestamps
    end
  end
end
