class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :user_services do |t|
      t.integer :user_id
      t.integer :service_id
      t.integer :locality_id

      t.timestamps null: false
    end
  end
end
