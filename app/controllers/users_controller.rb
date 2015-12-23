class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(edit_params)
    redirect_index
  end

  def delete
    redirect_index
  end

  private
  def redirect_index
    redirect_to :action => "index"
  end

  def edit_params
    params.require(:user).permit(:name, :email)
  end
end
