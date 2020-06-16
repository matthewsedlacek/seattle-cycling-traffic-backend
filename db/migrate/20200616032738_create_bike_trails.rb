class CreateBikeTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :bike_trails do |t|
      t.string :name
      t.float :distance
      t.string :trail_type

      t.timestamps
    end
  end
end
