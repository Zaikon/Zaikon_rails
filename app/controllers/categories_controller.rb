class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(create_params)
    redirect_index
  end

  def create
    Category.create(create_params)
    if current_user.categories.length == 1
      @alert1 = "カテゴリーの登録が出来ました！"
      @alert2 = "右上のメニューからも商品を追加出来ます！"
      @categories = current_user.categories
      render :index, val: @alert1, val:@alert2, val:@categories
    else
      redirect_index
    end
  end

  def destroy
    Category.destroy(params[:id])
    redirect_index
  end

  private
  def redirect_index
    redirect_to :action => "index"
  end

  def create_params
    params.require(:category).permit(:name).merge(:user_id => current_user.id)
  end
end
