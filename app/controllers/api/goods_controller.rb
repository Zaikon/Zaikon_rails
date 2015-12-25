class Api::GoodsController < ApplicationController
  protect_from_forgery expect: [:count_up, :count_down, :edit]

  before_action :set_goods

  def count_up
    @goods.update(stock_num: @goods.stock_num + 1)
    render :show
  end

  def count_down
    @goods.update(stock_num: @goods.stock_num - 1)
    render :show
  end

  def update
    @goods.update(update_params)
    render :show
  end

  private
  def set_goods
    @goods = Good.find(params[:id])
  end

  def update_params
    params.permit(
      :id,
      :name,
      :notification_num,
      :stock_num,
      :counting_type,
      :category_id,
    )
  end
end
