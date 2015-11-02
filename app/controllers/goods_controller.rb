class GoodsController < ApplicationController
  #ログインしていないユーザーが不正なアクセスをしない様に、予め設定しておく。
  before_action :unlogin, except: [:index]

  def index
    @goods = Good.all
  end

  def new
    @good = Good.new
  end

  def create
    Good.create(create_params)
    redirect_to :action => "index"
  end

  def up
    good = Good.find(params[:id])
    good.increment(:stock_num)
    if good.save
      render json: { stock_num: good.stock_num }.to_json
    end
  end

  def down
    good = Good.find(params[:id])
    good.decrement(:stock_num)
    if good.save
      render json: { stock_num: good.stock_num }.to_json
    end
  end

  private
  def create_params
    params.require(:good).permit(:name, :stock_num, :nitification_num, :image, :amazon_url, :category_id)
  end

  def unlogin #ログインしていないユーザーの不正なアクセスに対してリダイレクトする。
  unless user_signed_in?
    redirect_to :action => "index"
  end
  end
end
