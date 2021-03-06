require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Yuruyoga
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja

    config.load_defaults 5.2

    config.assets.paths << Rails.root.join("app", "assets", "font", "roboto")
    config.assets.paths << Rails.root.join("vendor", "assets", "img")
    config.assets.paths << Rails.root.join("vendor", "assets", "mdb-addons")

    config.autoload_paths << Rails.root.join('lib')

    config.generators do |g|
      g.assets false
      g.helper false

      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    end
  end
end
