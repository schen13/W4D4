class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      render :show
    else
      flash[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
  # def destroy
  #   @user = User.find_by(user_params)
  #   if @user
  #     logout!(@user)
  #     redirect_to users_url
  #   else
  #     flash[:errors] = ['Invalid deletion']
  #     redirect_to user_url(@user)
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
