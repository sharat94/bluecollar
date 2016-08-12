class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.integer :ticket_id
      t.integer :service_id

      t.timestamps null: false
    end
  end
end
