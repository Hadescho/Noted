# frozen_string_literal: true
require 'noted/renderer'
require 'noted/renderer/constants'
require 'noted/renderer/measurements'
describe Noted::Renderer::Measurements do
  let (:measurements) {Noted::Renderer::Measurements.new}
  describe 'widths' do
    it 'should be always as long as the screen' do
      width = measurements.name_width + measurements.priority_width +
              measurements.tags_width + measurements.description_width

      expect(width).to eq `tput cols`.to_i
    end
  end

end
