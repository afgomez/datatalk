require 'refinerycms-base'

module Refinery
  module Visualizations
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "visualizations"
          plugin.activity = {
            :class => Visualization,
            :title => 'legend'
          }
        end
      end
    end
  end
end
