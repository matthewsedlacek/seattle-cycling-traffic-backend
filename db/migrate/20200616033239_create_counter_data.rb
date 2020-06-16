class CreateCounterData < ActiveRecord::Migration[6.0]
  def change
    create_table :counter_data do |t|
      t.datetime :date_time
      t.integer :total_trips
      t.integer :direction_1
      t.integer :direction_2
      t.belongs_to :counter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
