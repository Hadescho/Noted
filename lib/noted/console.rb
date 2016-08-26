# frozen_string_literal: true
module Noted
  class Console
    COMMANDS = {
      add: /add/i,
      delete: /del(ite)?/i,
      edit: /edit/i,
      list: /list/i
    }.freeze

    NO_COMMAND_ERROR =  'No command detected. Please try again with ADD/DEL/' \
                        'EDIT/LIST as first argument after the binary name'

    attr_accessor :options

    def initialize(command)
      @command = parse_command(command)
      raise ArgumentError, NO_COMMAND_ERROR unless @command
      @options = {}
      @options[:tags_attributes] = []
      @notes_controller = NotesController.new
    end

    def perform
      # TODO: extract logic in more appropriate place
      case @command
      when :add
        @notes_controller.create(@options)
      when :delete
        @notes_controller.delete(@options)
      when :edit
        @notes_controller.edit(@options)
      when :list
        Noted::Renderer.new(options).list
      end
    end

    def add_tag(tag_name)
      options[:tags_attributes] << { name: tag_name }
    end

    private

    def parse_command(command)
      COMMANDS.find { |_, regex| regex.match(command) }&.first
    end
  end
end
