class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :trail_info
      t.string :trail_name
      t.string :lat_lon
      t.timestamps null: false
    end
  end
end
