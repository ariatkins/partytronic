class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_fbid(params[:session][:fbid])
		puts params
		sign_in user
	end

	def destroy
		sign_out
		redirect_to root_path
	end

end
