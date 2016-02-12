$LOAD_PATH << '../lib' # TODO: Change this

require 'active_record'
require 'yaml'

db_config = YAML.load_file('db/config.yml')
ActiveRecord::Base.establish_connection(db_config['test'])

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end
