class CreateCounters < ActiveRecord::Migration[6.0]
  def change
    create_table :counters do |t|
      t.string :name
      t.belongs_to :location, null: false, foreign_key: true
      t.belongs_to :bike_trail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
