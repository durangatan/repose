class AddFieldsInSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :sleep_quality, :integer
    add_column :surveys, :causation, :text
  end
end
