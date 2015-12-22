class Api::GoodsController < ApplicationController
  protect_from_forgery expect: [:count_up, :count_down]

  before_action :set_goods

  def count_up
    @goods.update(stock_num: @goods.stock_num + 1)
    render :show
  end

  def count_down
    @goods.update(stock_num: @goods.stock_num - 1)
    render :show
  end

  private
  def set_goods
    @goods = Good.find(params[:id])
  end
>>>>>>> fb31336fd5877663bfdc39a89567ca670eae8aed
end
