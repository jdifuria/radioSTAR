class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :show_id
      t.integer :chart_id
      t.integer :playlist_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end
