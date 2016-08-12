class ServicesController < ApplicationController
	before_action :authenticate_user! 
	load_and_authorize_resource
	def index
		@services = current_user.services
	end
	def new
		@service = Service.new
	end
	def edit
		@locality = current_user.services.find(params[:id])
	end

	def create
 		@service =Service.new(service_params)
 		@service.user_id=current_user.id
 		if @service.save
 			redirect_to services_path
 		else
 			render action: "new"
 		end
 	end
	private
	def service_params
		params[:service].permit(service_ids: [])
	end

end
