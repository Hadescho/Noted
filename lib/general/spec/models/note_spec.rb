require 'active_record_spec_helper'

require_relative '../../models/note'
require_relative '../../models/tag'
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
      expect(note.tags).to be_a ActiveRecord::Associations::CollectionProxy
    end
  end
end
