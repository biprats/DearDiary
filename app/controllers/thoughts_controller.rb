class ThoughtsController < ApplicationController
	before_filter :get_author

	def get_author
		@author = Author.find_by(id: params[:author_id])
	end

	def new
		@thought = @author.thoughts.build
	end
	
	# POST /thoughts
	def create
		@thought = @author.thoughts.create(thought_params)
		redirect_to author_thought_path(@thought.author_id, @thought.id)
	end
	
	def edit
		@thought = @author.thoughts.find(params[:id])
	end
		
	# PUT /thoughts/3
	def update
		@thought = @author.thoughts.find(params[:id])
		@thought.update(thought_params)
		redirect_to author_thought_path(@author.id, @thought.id)
	end

	# GET /thoughts/3
	def show
		@thought = Thought.find(params[:id])
		@thought_author = @thought.author
	end

	# DELETE /thoughts/3
	def destroy
		@thought = @author.thoughts.find(params[:id])
		@thought.destroy
		redirect_to author_path(@author), notice: "Diary Entry Ripped Out"
	end

	def index
		@thoughts = Thought.all
		respond_to do |format|
			format.html do
				@authors = Author.all
				@thoughts = @thoughts.limit(5)
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

	def thought_params
		params.require(:thought).permit(:text)
	end

end