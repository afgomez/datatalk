puts "loading #{RAILS_ENV} config"
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
puts APP_CONFIG.inspect