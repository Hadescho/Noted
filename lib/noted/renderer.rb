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
      puts Rainbow('Noted'.center(@measurements.screen_width)).fg(fg).bg(bg)
      puts Rainbow(header).foreground(fg).background(bg)
    end

    def render
      render_header
      render_body
    end

    def render_body
      color_pairs_count = Constants::COLOR_PAIRS.size
      grouped = @notes.group_by { |note| note.tags.first.name }
      grouped.each_pair.with_index do |(_ , group), index|
        color_pair = Constants::COLOR_PAIRS[index % color_pairs_count]
        group.sort_by(&:priority).reverse!.each do |note|
          note.decorate(color_pair, @measurements).print
        end
      end
    end

    private

    def prepare_for_header(string, length)
      string.length > length ? string[0, length] : string.center(length)
    end
  end
end
