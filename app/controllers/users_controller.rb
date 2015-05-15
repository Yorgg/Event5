class UsersController < ApplicationController
  def new
	@user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      login @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:password,:email)
  end

  def show
  	unless logged_in?
  	  redirect_to login_path
  	  return
    end
  	@user = current_user
  end
end
