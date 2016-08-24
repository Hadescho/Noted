module Noted
  class Console
    COMANDS = {
      add: /add/i,
      delete: /del(ite)?/i,
      edit: /edit/i,
      list: /list/i
    }.freeze
    attr_accessor :options
    def initialize(command)
      @command = parse_command(command)
      @options = {}
      @options[:tags_attributes] = []
      @notes_controller = NotesController.new
    end

    def perform
      # TODO: extract logic in more appropriate place
      case @command
      when :add
        @notes_controller.create(@options)
      end
    end

    def add_tag(tag_name)
      options[:tags_attributes] << { name: tag_name }
    end

    private

    def parse_command(command)
      COMANDS.each do |command_symbol, regex|
        return command_symbol if command.match(regex)
      end
    end
  end
end
