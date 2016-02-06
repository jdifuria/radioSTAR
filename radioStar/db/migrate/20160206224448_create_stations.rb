class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :user_id
      t.integer :station_id
      t.string :station_name
      t.string :station_url

      t.timestamps null: false
    end
  end
end
