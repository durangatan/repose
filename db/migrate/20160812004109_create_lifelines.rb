class CreateLifelines < ActiveRecord::Migration[5.0]
  def change
    create_table :lifelines do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :phone
    	t.integer :user_id
    	
      t.timestamps
    end
  end
end
