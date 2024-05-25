class UsersController < ApplicationController
  
  def new
    @user=User.new
  end
  
  def create
    @user = User.new(user_params[:id])
    
    if @user.save
      flash[:notice] = "Signed in successfully"
      redirect_to books_path
    else
      flash.now[:notice] = "投稿に失敗しました。"
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
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(@user.id)
      # 遷移先はuserのshowページ
    end
  end
  
  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
      # 遷移先はuserのshowページ
    else
      render :edit
    end
  end
  
  def destroy
    # ログアウト処理
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end
  
  
   private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :introduction)
  end
  
end
