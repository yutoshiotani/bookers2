class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    
  end
  
  def index
  end

  def new
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
