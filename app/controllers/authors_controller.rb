class AuthorsController < ApplicationController

	def new
	end
	
	# POST /authors
	def create
		@author = Author.create(author_params)
		if @author.valid?
			session[:author_id] = @author.id
			redirect_to author_path(@author)
		else
			redirect_to :back, notice: @author.errors.full_messages.join(", ")
		end
	end

	# PUT /authors/3
	def update
		@author = Author.find(params[:id])
		@author.update(author_params)
		redirect_to author_path(@author)
	end

	# GET /authors/3
	def show
		@author = Author.find(params[:id])
	end
	
	def edit
		@author = Author.find(params[:id])
	end
	# DELETE /authors/3
	def destroy
		@author = Author.find(params[:id])
		@author.destroy
		redirect_to authors_path, notice: "Diary Burned"
	end

	def index
		@authors = Author.all
	end
	
	def author_params
		params.require(:author).permit(:name, :bio, :password)
	end

end