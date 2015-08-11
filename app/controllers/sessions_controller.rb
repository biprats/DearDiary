class SessionsController < ApplicationController

	def create
		@author = Author.find_by(name: params[:author][:name])
		if @author.try(:authenticate, params[:author][:password])
			session[:author_id] = @author.id
			redirect_to author_path(@author)
		else
			redirect_to :back
		end
	end

	def destroy
		session.clear
		redirect_to thoughts_path
	end
end