class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :user_id
      t.string :sender_email
      t.string :sender_name
      t.string :recipient_email
      t.string :link

      t.timestamps
    end
  end
end
