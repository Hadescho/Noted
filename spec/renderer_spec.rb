# frozen_string_literal: true
require 'noted/renderer'
require 'noted/renderer/constants'

describe Noted::Renderer do
  let(:renderer) { Noted::Renderer.new([]) }

  
  describe '#header' do
    subject { renderer.header }

    it { is_expected.to include('NAME') }
    it { is_expected.to include('DESCRIPTION') }
    it { is_expected.to include('TAGS') }
    it { is_expected.to include('PRIORITY') }
  end
end
