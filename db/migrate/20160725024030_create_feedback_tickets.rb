class CreateFeedbackTickets < ActiveRecord::Migration
  def change
    create_table :feedback_tickets do |t|
      t.integer :ticket_id
      t.float :ticket_rating
      t.float :user_rating
   
    end
  end
end
