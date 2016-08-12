class LocalitiesController < ApplicationController
before_action :authenticate_user! only:index
load_and_authorize_resource
	def index
		@localities = Locality.all
	end

	def new
		@locality = Locality.new
	end
	def edit
		@locality = current_user.localities.find(params[:id])
	end

	def create
 		@locality =Locality.new(locality_params)
 		@locality.user_id=current_user.id
 		if @locality.save
 			redirect_to localities_path
 		else
 			render action: "new"
 		end
 	end
	
	def show
	@locality = current_user.localities.find(params[:id])
	end 

	def update
		@locality = current_user.localities.find(params[:id])
		@locality.user_id=current_user.id
		if @locality.update_attributes(locality_params)
			redirect_to locality_path(@locality.id),notice: "successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@locality = current_user.localities.find(params[:id])
		if @locality.destroy
			redirect_to localities_path, notice: "Successfully destroyed!!"
		end
	end
	private
	def locality_params
		params[:locality].permit(:name, :city_id)
	end

end
