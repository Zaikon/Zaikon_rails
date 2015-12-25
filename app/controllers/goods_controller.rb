class GoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :category_registered, only: [:index, :new]
  # append_after_action :redirect_index, only: [:create, :update, :destroy]

  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def new
    @good = Good.new
    @categories = Category.where(user_id: current_user.id)
    amazon_api
  end

  def create
    good = Good.new(create_params)
    if good.save
      redirect_index
    else
      @good = good
      @categories = Category.where(user_id: current_user.id)
      render :new, val: @good_params, val: @good , val: @categories
    end
  end

  def edit
    @good = Good.find(params[:id])
    @categories = Category.where(user_id: current_user.id)
  end

  def update
    good = Good.find(params[:id])
    if good.update(create_params)
      redirect_index
    else
      @good = good
      @categories = Category.where(user_id: current_user.id)
      render :edit, val: @good_params, val: @good , val: @categories
    end
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
    SampleWorker.perform_async(current_user.id, good.id) if good.stock_num <= good.notification_num
  end

  private
  def create_params
    params.require(:good).permit(:name, :stock_num, :notification_num, :image, :amazon_url, :category_id, :counting_type)
  end

  def redirect_index
    redirect_to :action => "index"
  end

  def redirect_newe
    redirect_to :action => "new"
  end

  def return_json(good)
    if good.save
      render json: { stock_num: good.stock_num }.to_json
    end
  end

  def send_mail
    SampleMailer.send_when_update(current_user,good).deliver
  end

  def category_registered
    @categories = []
    @alert1 = "まずはカテゴリーを登録してください！！"
    @alert2 = "登録後に商品の登録が出来ます。"
    render :template => "categories/index", val: @categories, val: @alert unless current_user.categories.present?
  end

  def amazon_api
    if params[:keyword].present?
      #デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      api_goods = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'All',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp'
      )

      # 本のタイトル,画像URL, 詳細ページURLの取得
      @api_goods = []
      api_goods.items.each do |item|
        api_good = Apigood.new(
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
          item.get('ItemAttributes/ListPrice/FormattedPrice'),
        )
        @api_goods << api_good
      end
    end
  end
end
