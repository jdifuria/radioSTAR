class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :playlist_id
      t.string :title
      t.string :artist
      t.string :album
      t.string :label
      t.string :genre
      t.datetime :time

      t.timestamps null: false
    end
  end
end
