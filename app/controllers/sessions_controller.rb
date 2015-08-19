class SessionsController < ApplicationController

	def create
		@author = Author.where("LOWER(name) = LOWER(?) OR LOWER(email) = LOWER(?)", params[:author][:email], params[:author][:email]).first
		if @author.try(:authenticate, params[:author][:password])
			session[:author_id] = @author.id
			redirect_to author_path(@author)
		else
			redirect_to :back, notice: "Name/Email and Password Combination is Incorrect"
		end
	end

	def destroy
		session.clear
		redirect_to thoughts_path
	end
end