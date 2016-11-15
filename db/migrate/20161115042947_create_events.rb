class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :artist
      t.date :date
      t.integer :price
      t.string :url

      t.timestamps
    end
  end
end
