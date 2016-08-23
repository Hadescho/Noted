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
  describe '#name' do
    context 'when giving the same name twice' do
      # it 'should validate name uniqueness'
      it 'should raise ActiveRecord::RecordInvalid' do
        Note.create!(name: 'Test')
        expect { Note.create!(name: 'Test') }
          .to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
  describe '.find_by_id_or_name' do
    context 'when giving neither id nor name' do
      it 'should raise argumentError' do
        expect { Note.find_by_id_or_name }.to raise_error ArgumentError
      end
    end
  end
end
