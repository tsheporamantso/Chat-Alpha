class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new( user_params )

    if @user.save
      flash[:success] = "Welcome to Chat-Alpha #{@user.username}, you have successfully signed up."
      redirect_to articles_path 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:sucess] = "Chat-Alpha user #{ @user.username }, has been updated sucessfully"
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
