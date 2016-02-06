class AddIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_id, :int
  end
end
