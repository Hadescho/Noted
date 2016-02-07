require 'yaml'
require 'active_record'
require 'logger'

require_relative 'models/note.rb'

module ActiveRecordControl
  def self.connect(db_config, enable_logger: false, logger_output: STDOUT)
    environment = ENV["RACK_ENV"] || 'development'
    ActiveRecord::Base.establish_connection(db_config[environment])
    ActiveRecord::Base.logger = Logger.new(@logger_output) if @enable_logger
  end
end

db_config = YAML.load_file('db/config.yml')
ActiveRecordControl.connect(db_config, enable_logger: true)
