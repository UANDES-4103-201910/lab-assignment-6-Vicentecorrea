class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.where(password: params[:session][:password], email: params[:session][:email])[0]
		if user
			flash[:notice] = "Successful session."
			cookies[:logged_user] = user
			#session[:current_user_id] = user.id
			redirect_to user
		else
			flash[:notice] = "Session error."
			redirect_to root_url
		end
	end

	def destroy
		#complete this method
		cookies[:logged_user] = nil
		redirect_to root_url
	end

	private

	def session_params
		params.require(:user).permit(:email, :password)
	end
end
