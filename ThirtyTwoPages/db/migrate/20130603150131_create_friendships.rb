class CreateFriendships < ActiveRecord::Migration
  def change
    change_table do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
