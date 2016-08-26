# frozen_string_literal: true
require 'yaml'
require 'active_record'

module ActiveRecordControl
  def self.connect(db_config, enable_logger: false, logger_output: STDOUT)
    environment = ENV['RACK_ENV'] || 'development'
    ActiveRecord::Base.establish_connection(db_config[environment])
    ActiveRecord::Base.logger = Logger.new(logger_output) if enable_logger
  end
end
