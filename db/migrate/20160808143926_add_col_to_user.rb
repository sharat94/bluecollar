class AddColToUser < ActiveRecord::Migration
  def change
  	add_column :users, :address , :text
  	add_column :users, :role , :string
  	add_column :users, :verified , :boolean , default: false
  end
end
