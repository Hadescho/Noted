# frozen_string_literal: true
module Noted
  class Renderer
    module Constants
      LENGTHS = {
        name_length_percent: 0.15,
        name_length_min: 10,
        priority_length_percent: 0.05,
        priority_length_min: 5,
        tags_length_percent: 0.35,
        tags_length_min: 25
      }.freeze

      COLOR_PAIRS = [
        { bg: :black, fg: :green },
        { bg: :black, fg: :cyan },
        { bg: :black, fg: :magenta },
        { bg: :black, fg: :yellow },
        { bg: :black, fg: :orange },
        { bg: :black, fg: :red },
        { bg: :black, fg: :violet }
      ].freeze

      HEADER_PAIR = { bg: :black, fg: :white }.freeze
    end
  end
end
