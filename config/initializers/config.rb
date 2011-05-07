puts "loading #{RAILS_ENV} config"
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]
puts APP_CONFIG.inspect