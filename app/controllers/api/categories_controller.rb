class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.eager_load(:goods).all
  end
end
