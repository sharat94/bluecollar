class TicketsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@tickets = current_user.is_admin? ? Ticket.all : current_user.tickets
	end

	def new
		@ticket = Ticket.new
	end
	def create
 		@ticket =Ticket.new(ticket_params)
 		@ticket.user_id = current_user.id
 		if @ticket.save
 			redirect_to tickets_path
 		else
 			render action: "new"
 		end
 	end
	
	def show
		@ticket = current_user.is_admin? ? Ticket.find(params[:id]) : current_user.tickets.find(params[:id])
		@fticket =  FeedbackTicket.new 

	end 

	def edit
		@ticket = current_user.tickets.find(params[:id])
	end

	def update
		@ticket = current_user.tickets.find(params[:id])
		@ticket.user_id = current_user.id
		if @ticket.update_attributes(ticket_params)
			redirect_to ticket_path(@ticket.id),notice: "successfully updated"
		else
			render action: "edit"
		end
	end
	def destroy
		@ticket = current_user.tickets.find(params[:id])
		if @ticket.destroy
			redirect_to tickets_path,notice: "successfully destroyed!!"
		end
	end
	def mark_as_complete 
		
		@ticket = Ticket.find (params[:ticket_id])
		@ticket.update_attributes(resolved: true)
		Notification.completed(@ticket, current_user).deliver!
		redirect_to new_feedback_ticket_path, notice: "successfully completed the task"
	end


	private
	def ticket_params
		params[:ticket].permit(:title,:locality_id,:city_id,:body, :service_ids [])
	end

end

