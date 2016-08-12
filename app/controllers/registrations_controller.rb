class RegistrationsController < Devise::RegistrationsController
private
 	def sign_up_params
 		params[:user].permit(:email, :password, :password_confirmation, :role, service_ids: [])
 	end
end
