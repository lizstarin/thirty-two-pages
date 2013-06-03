class CreateProfiles < ActiveRecord::Migration
  def change
    create_table do |t|
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
