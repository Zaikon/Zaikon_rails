# Load the Rails application.
require File.expand_path('../application', __FILE__)

Amazon::Ecs.options = {
      associate_tag:     ENV["ASSOCIATION_TAG"],
      AWS_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      AWS_secret_key:   ENV["AWS_ACCESS_KEY_KEY"]
}

# Initialize the Rails application.
Rails.application.initialize!
