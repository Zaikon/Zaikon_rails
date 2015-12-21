class Api::GoodsController < ApplicationController
  protect_from_forgery expect: [:count_up, :count_down]

  before_action :set_categories
  before_action :set_goods

  def count_up
    @goods.update(stock_num: @goods.stock_num + 1)
    @categories = Category.eager_load(:goods).all
    render template: 'api/categories/index'
  end

  def count_down
    @goods.update(stock_num: @goods.stock_num - 1)
    @categories = Category.eager_load(:goods).all
    render template: 'api/categories/index'
  end

  private
  def set_categories
    @categories = Category.eager_load(:goods).all
  end

  def set_goods
    @goods = Good.find(params[:id])
  end
end
