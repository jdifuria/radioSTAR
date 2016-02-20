class AddStationIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :station_id, :integer
  end
end
