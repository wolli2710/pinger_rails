class UsersController < ApplicationController


  before_filter :authenticate_user!, :except => [:index]
  before_filter :check_user, :only => [:edit, :destroy]

  def show
    @user = User.find(params[:id])
  end


private
  def check_user
    @user = User.find(params[:id])
    unless signed_in? && current_user.id == @user.id
      flash[:error] = "Action not allowed!"
      redirect_to root_path
    end
  end
end
