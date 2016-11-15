class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :address
      t.string :venue_name
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
