class CitiesController < ApplicationController
	
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@cities = City.all
	end

	def new
		@city = City.new
	end

	def create
 		@city =City.new(city_params)
 		@city.user_id = current_user.id
 		if @city.save
 			redirect_to cities_path
 		else
 			render action: "new"
 		end
 	end
	
	def show
	@city = current_user.cities.find(params[:id])
	end 

	def edit
		@city = current_user.cities.find(params[:id])
	end

	def update
		@city = current_user.cities.find(params[:id])
		@city.user_id = current_user.id
		if @city.update_attributes(city_params)
			redirect_to city_path(@city.id),notice: "successfully updated"
		else
			render action: "edit"
		end
	end
	def destroy
		@city = current_user.cities.find(params[:id])
		if @city.destroy
			redirect_to cities_path,notice: "successfully destroyed!!"
		end
	end

	private
	def city_params
		params[:city].permit(:name)
	end

end