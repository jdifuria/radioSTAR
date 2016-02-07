class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.references :user, index:true, foreign_key: true
      t.string :station_name
      t.string :station_url

      t.timestamps null: false
    end
  end
end
