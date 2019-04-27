class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_same_user, only: [:edit, :update]
	def index
		@users = User.all	
	end

	def new
		@user = User.new
	end

	def show
		
	end

	def edit
		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "User was successfully created."
			redirect_to user_path(@user)
		else
			render "new"
		end
	end

	def update
		if @user.update(user_params)
			flash[:success] = "User was successfully updated."
			redirect_to user_path(@user)
		else
			render "edit"
		end
	end

	def destroy
		@user.destroy
		flash[:danger] = "User was successfully deleted."
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:full_name, :mobile_number, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user
			flash[:danger] = "You can only edit your own account."
		end
	end
end
