class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new 
	end

	def show
		@category = Category.find(params[:id])
		@category_articles = @category.articles
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category was successfully created."
			redirect_to category_path(@category)
		else
			render "new"
		end
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:success] = "Category was successfully updated."
			redirect_to category_path(@category)
		else
			render "edit"
		end
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end
