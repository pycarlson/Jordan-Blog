class PostsController < ApplicationController
	http_basic_authenticate_with :name => "Jlove", :password => "sexyass"
	
	def index
		@posts = Post.all
		
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.atom
    end
	end

	def show
		@post = Post.find(params[:id])
		@comments = Comment.all
		@comment = Comment.new
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		@post = Post.create(title:params[:post][:title], body:params[:post][:body])
		current_user.posts << @post
		if @post.save
			@post.add_categories(params[:post][:category_ids])
			redirect_to @post
		else
			redirect_to root_path
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(title:params[:post][:title], body:params[:post][:body])
		@post.categories.clear
		if @post.save
			@post.add_categories(params[:post][:category_ids])
			redirect_to @post
		else
			redirect_to edit_post_path(@post)
		end
	end

	def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to blog_admin_path
	end

	private

  # def user_params
  #   params.require(:post).permit()
  # end
end