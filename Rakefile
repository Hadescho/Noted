require 'rspec/core/rake_task'
require 'yaml'
require "active_record"
require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :db do
  config = YAML.load(File.open('db/config.yml'))

  desc 'Creates the database'
  task :create do
    print 'Creating database ...'
    environment = ENV['RACK_ENV'] || 'development'
    ActiveRecord::Base.establish_connection(config[environment])
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.connection.create_database(
      config[environment]['database']
    )
    puts ' done'
  end
end
