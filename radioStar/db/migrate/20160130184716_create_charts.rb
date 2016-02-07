class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :name
      t.string :country
      t.string :source_url

      t.timestamps null: false
    end
  end
end
