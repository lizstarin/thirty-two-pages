class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
