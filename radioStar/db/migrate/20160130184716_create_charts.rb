class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :name
      t.string :country
      t.string :source_url

      t.references :station, index:true, foreign_key: true

      t.timestamps null: false
    end
  end
end
