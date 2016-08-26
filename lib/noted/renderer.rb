# frozen_string_literal: true
module Noted
  class Renderer
    def initialize(notes)
      @measurements = Measurements.new
      @notes = notes
    end

    
    def header
      prepare_for_header('NAME', @measurements.name_width) +
        prepare_for_header('DESCRIPTION', @measurements.description_width) +
        prepare_for_header('TAGS', @measurements.tags_width) +
        prepare_for_header('PRIORITY', @measurements.priority_width)
    end

    def render_header
      fg = Constants::HEADER_PAIR[:fg]
      bg = Constants::HEADER_PAIR[:bg]
      puts Rainbow('Noted'.center(@measurements.screen_width)).foreground(fg).bg(bg)
      puts Rainbow(header).foreground(fg).background(bg)
    end

    def render
      render_header
    end

    private

    def prepare_for_header(string, length)
      string.length > length ? string[0, length] : string.center(length)
    end
  end
end
