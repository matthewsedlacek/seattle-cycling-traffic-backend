class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :user_name
      t.string :content
      t.belongs_to :bike_trail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
