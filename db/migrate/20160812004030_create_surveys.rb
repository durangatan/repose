class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
    	t.integer :severity
    	t.text :comments
    	t.integer :event_id
      t.timestamps
    end
  end
end
