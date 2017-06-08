class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.datetime :start_date_time
      t.integer :duration_seconds
      t.integer :starting_airport_id
      t.integer :finishing_airport_id      
      t.timestamps
    end
  end
end
