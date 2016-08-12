class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
    	t.integer :start_hour
    	t.integer :end_hour
    	t.integer :weekday
    	t.integer :lifeline_id

      t.timestamps
    end
  end
end
