class GoodsController < ApplicationController
  #ログインしていないユーザーが不正なアクセスをしない様に、予め設定しておく。
  before_action :authenticate_user!
  # append_after_action :redirect_index, only: [:create, :update, :destroy]

  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def new
    @good = Good.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    Good.create(create_params)
    redirect_index
  end

  def edit
    @good = Good.find(params[:id])
    @categories = Category.where(user_id: current_user.id)
  end

  def update
    good = Good.find(params[:id])
    good.update(create_params)
    redirect_index
  end

  def destroy
    Good.destroy(params[:id])
    redirect_index
  end

  def up
    good = Good.find(params[:id])
    good.increment(:stock_num)
    return_json(good)
  end

  def down
    good = Good.find(params[:id])
    good.decrement(:stock_num)
    return_json(good)
  end

  private
  def create_params
    params.require(:good).permit(:name, :stock_num, :notification_num, :image, :amazon_url, :category_id, :counting_type)
  end

  def redirect_index
    redirect_to :action => "index"
  end

  def return_json(good)
    if good.save
      render json: { stock_num: good.stock_num }.to_json
    end
  end

end
