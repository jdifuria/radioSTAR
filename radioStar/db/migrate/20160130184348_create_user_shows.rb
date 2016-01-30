class CreateUserShows < ActiveRecord::Migration
  def change
    create_table :user_shows do |t|
      t.integer :show_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
