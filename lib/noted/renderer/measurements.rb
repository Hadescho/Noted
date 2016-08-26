# frozen_string_literal: true

module Noted
  class Renderer
    class Measurements
      attr_accessor :screen_width
      def initialize
        @screen_width = `tput cols`.to_i
      end

      def name_width
        @name_width ||= [Constants::LENGTHS[:name_length_min],
                         @screen_width *
                           Constants::LENGTHS[:name_length_percent]].max.floor
      end

      def priority_width
        @priority_width ||= [Constants::LENGTHS[:name_length_min],
                             @screen_width *
                               Constants::LENGTHS[:priority_length_percent]].max
                            .floor
      end

      def tags_width
        @tags_width ||= [Constants::LENGTHS[:name_length_min],
                         @screen_width *
                           Constants::LENGTHS[:tags_length_percent]].max.floor
      end

      def description_width
        @description_width ||= @screen_width - name_width - priority_width -
                               tags_width
      end
    end
  end
end
