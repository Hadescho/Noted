# frozen_string_literal: true

class NoteDecorator
  def initialize(note, color_pair, measurements)
    @note = note
    @color_pair = color_pair
    @measurements = measurements
    @screen_width = ENV['COLUMNS']
  end

  # TODO: Extract to Decorator module
  def method_missing(method_name, *args, &block)
    super unless @note.respond_to?(method_name)
    @note.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    @note.respond_to?(method_name) || super
  end

  def original
    @note
  end

  def tag_names
    tags.map(&:name).join(', ')
  end

  def line
    prepare_for_line(name, @measurements.name_width) +
      prepare_for_line(description, @measurements.description_width) +
      prepare_for_line(tag_names, @measurements.tags_width) +
      prepare_for_line(priority.to_s, @measurements.priority_width)
  end

  def print
    puts Rainbow(line).foreground(@color_pair[:fg]).background(@color_pair[:bg])
  end

  private 

  def prepare_for_line(string, length)
    return ' ' * length if string.blank?
    string.length > length ? "#{string[0, length - 1]}…" : string.ljust(length)
  end
end
