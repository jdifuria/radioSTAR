class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.references :user, index:true, foreign_key: true
      t.references :chart, index:true, foreign_key: true
      t.references :show, index:true, foreign_key: true

      t.string :station_name
      t.string :station_url
      t.string :message_of_the_day

      t.timestamps null: false
    end
  end
end
