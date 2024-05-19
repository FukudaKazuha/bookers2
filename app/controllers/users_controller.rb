class UsersController < ApplicationController
  
  def new
    @user=User.new
    
  end
  
  def create
    @user = User.new(user_params[:id])
    
    if @user.save
      redirect_to books_path
    # リダイレクト先はマイページ
    else
      render:new
    end
  end
  
  def show
    @user = User.find(params[:id])  
     
  end
  
  def edit
  end
  
  
   private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
