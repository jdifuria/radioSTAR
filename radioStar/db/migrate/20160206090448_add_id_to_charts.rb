class AddIdToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :chart_id, :int
  end
end
