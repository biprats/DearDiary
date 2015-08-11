class ThoughtsController < ApplicationController
	before_filter :get_author

	def get_author
		@author = Author.find_by(id: params[:author_id])
	end

	def new
	end
	
	# POST /thoughts
	def create
	end
	
	# PUT /thoughts/3
	def update
		@thought = Thought.find(params[:id])
	end

	# GET /thoughts/3
	def show
		@thought = Thought.find(params[:id])
		@thought_author = @thought.author
	end

	# DELETE /thoughts/3
	def destroy
	end

	def index
		@authors = Author.all
		@thoughts = Thought.all
	end

end