class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    redirect_index
  end

  def delete
    redirect_index
  end

  private
  def redirect_index
    redirect_to :action => "index"
  end
end
