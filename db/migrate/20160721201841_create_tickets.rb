class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.date :ticket_date
      t.boolean :resolved 
      t.integer :user_id
      t.integer :city_id
      t.integer :locality_id

      t.timestamps null: false
    end
  end
end
