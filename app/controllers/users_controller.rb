class UsersController < ApplicationController
  
  def new
    @user=User.new
  end
  
  def create
    @user = User.new(user_params[:id])
    
    if @user.save
      redirect_to books_path
    
    else
      render:new
    end
  end
  
  def index
    @users=User.all
    @user=current_user
    # @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])  
    @books=@user.books
  end
  
  def edit
    @user = User.find(params[:id])  
  end
  
  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      # flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
      # 遷移先はuserのshowページ
    else
      render :edit
    end
  end
  
  
   private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :introduction)
  end
  
end
