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
		if @author.update(author_params)
			redirect_to author_path(@author), alert: "You've Changed"
		else
			redirect_to :back, notice: @author.errors.full_messages.join(", ")
		end
	end

	# GET /authors/3
	def show
		@author = Author.find(params[:id])
		@thoughts = @author.thoughts
		respond_to do |format|
			format.html do
				@authors = Author.all
				@thoughts = @thoughts.all.limit(5)
			end
			format.json do
				@next_thoughts = @thoughts.offset(params[:page].to_i*5).limit(5)
				render json: {
					thoughts: @next_thoughts.as_json(include: :author, methods: [:time_ago]),
					end_thoughts: @thoughts.offset(params[:page].to_i*5+5).count.zero?
				}
			end
		end
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
		params.require(:author).permit(:name, :bio, :password, :email, :password_confirmation, :admin)
	end

end