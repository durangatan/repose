class Addbearertokeninusers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bearer_token, :string
  end
end
