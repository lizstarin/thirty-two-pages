class CreateSearches < ActiveRecord::Migration
  def change
		create_table :user_searches do |t|
			t.string :input
			t.string :result
			
			t.timestamps
		end
  end
end
