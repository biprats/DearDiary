class AuthorsController < ApplicationController

	def new
	end
	
	# POST /authors
	def create
		@author = Author.create(author_params)
		session[:author_id] = @author_id
		redirect_to author_path(@author)
	end

	# PUT /authors/3
	def update
		@author = Author.find(params[:id])
	end

	# GET /authors/3
	def show
		@author = Author.find(params[:id])
	end
	
	# DELETE /authors/3
	def destroy
	end

	def index
		@authors = Author.all
	end
	
	def author_params
		params.require(:author).permit(:name, :bio, :password)
	end

end