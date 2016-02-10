require 'active_record_spec_helper'

require 'noted/note'
require 'noted/tag'

describe Note do
  let(:note) { Note.create!(name: 'test') }
  describe '.create' do
    it 'validates the presence of name' do
      expect { Note.create!(name: nil) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#tags' do
    it 'should be able to have multiple tags ' do
      expect(note).to respond_to(:tags)
    end
  end
end
