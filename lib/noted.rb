# frozen_string_literal: true
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'noted/version'
require 'noted/note'
require 'noted/tag'
require 'noted/notes_controller'
require 'noted/active_record_control'
require 'noted/console'
require 'noted/renderer'
require 'noted/renderer/constants'
require 'noted/renderer/measurements'
require 'noted/note_decorator'
require 'byebug'
require 'rainbow'

db_config = YAML.load_file('db/config.yml')
ActiveRecordControl.connect(db_config, enable_logger: false)
