class UsersController < ApplicationController
  def index
  	@users=User.all
  end

  def show
  	@user=User.find(params[:id])
  end

  def new
  	@user=User.new
  end
  
  def create
  	@user=User.new(user_params)
  	if @user.save
      flash[:success] = "Welcome to the Site!"
  		redirect_to @user 
  	else
      flash.now[:danger] = "Please correct the errors!"
  		render :new
  	end
  end

  def edit
  	@user=User.find(params[:id])
  end

  def update
  	@user=User.find(params[:id])
  	if @user.update(user_params)
      flash[:success] = "Profile updated!"
  		redirect_to @user
  	else
      flash.now[:danger] = "Please correct the errors!"
  		render :edit
  	end
  end

  def destroy
  	@user=User.find(params[:id])
  	@user.delete
  	redirect_to users_path
  end

  private
    def user_params
	  	params.require(:user).permit(:name, :email, :password, :confirm_password)
	  end
end
