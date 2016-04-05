class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :timeslot
      t.float :compliance

      t.timestamps null: false
    end
  end
end
