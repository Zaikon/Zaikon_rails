require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Zaikon
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine      false
      g.test_framework       false
      g.helper               false
      g.stylesheets          false
      g.javascripts          false
    end
    
    config.active_record.raise_in_transactional_callbacks = true

    I18n.enforce_available_locales = true
     config.i18n.default_locale = :ja
  end
end
