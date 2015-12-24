module Api
  class ApiController < ::ApplicationController
    before_action :authenticate_user!, only: []

    private

    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end
