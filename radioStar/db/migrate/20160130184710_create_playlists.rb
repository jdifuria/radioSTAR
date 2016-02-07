class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references :show, index:true, foreign_key: true
      t.references :chart, index:true, foreign_key: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
