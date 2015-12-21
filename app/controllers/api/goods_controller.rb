class Api::GoodsController < ApplicationController
  before_action :doorkeeper_authorize!
end
