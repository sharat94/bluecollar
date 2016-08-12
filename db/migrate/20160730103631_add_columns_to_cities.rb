class AddColumnsToCities < ActiveRecord::Migration
  def change
  	add_column :cities , :user_id, :integer
  	add_column :localities, :user_id, :integer
  	
  end
end
