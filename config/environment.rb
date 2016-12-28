# Load the Rails application.
require File.expand_path('../application', __FILE__)

Amazon::Ecs.options = {
      associate_tag:     ENV["association_tag"],
      AWS_access_key_id: ENV["AWS_access_key_id"],
      AWS_secret_key:   ENV["AWS_secret_key"]
}

# Initialize the Rails application.
Rails.application.initialize!
