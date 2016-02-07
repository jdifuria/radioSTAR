class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :playlist, index:true, foreign_key: true
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
