Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass
  config.assets.compile = false

  config.log_level = :debug
  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: 'the-breakfast-club.herokuapp.com',
    authentication: :plain
  }
  # config.action_mailer.raise_delivery_errors = false

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
