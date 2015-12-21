class Api::CategoriesController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    @categories = Category.eager_load(:goods).all
  end
end
