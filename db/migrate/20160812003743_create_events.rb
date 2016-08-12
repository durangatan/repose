class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.datetime :start_time
    	t.datetime :end_time
    	t.integer :survey_id
    	t.integer :user_id
      	
      	t.timestamps
    end
  end
end
