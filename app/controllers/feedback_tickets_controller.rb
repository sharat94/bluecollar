class FeedbackTicketsController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource
	def index
		@ftickets = FeedbackTicket.all
	end
	def new
		@fticket = FeedbackTicket.new

	end
	def create
 		@fticket =FeedbackTicket.new(feedback_ticket_params)
 		if @fticket.save
 			redirect_to feedback_tickets_path
 		else
 			render action: "new"
 		end
 	end
	
 	private
	def feedback_ticket_params
		params[:feedback_ticket].permit(:user_rating, :ticket_id, :ticket_rating)
	end
end
