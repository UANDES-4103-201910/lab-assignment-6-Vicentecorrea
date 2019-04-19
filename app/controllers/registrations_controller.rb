class RegistrationsController < ApplicationController
	def new

	end

	def create
	    #complete this method
			user = User.create(
					name: params[:registrations][:name],
					last_name: params[:registrations][:last_name],
					email: params[:registrations][:email],
					phone: params[:registrations][:phone],
					password: params[:registrations][:password])
				if user.save
					flash[:notice] = "Successful registration."
					redirect_to root_url
				else
					flash[:notice] = "Registration error."
					redirect_to registrations_url
					#format.html { render :new }
					#format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			#end
	end

	private

	def create_params
		params.require(:user).permit(:name, :last_name, :email, :password, :phone)
	end
end
