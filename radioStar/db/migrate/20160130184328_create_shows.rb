class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :show_id
      t.string :name
      t.string :timeslot

      t.timestamps null: false
    end
  end
end
