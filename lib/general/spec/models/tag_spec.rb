require 'active_record_spec_helper.rb'

require_relative '../../models/tag'
require_relative '../../models/note'

describe Tag do
  let(:note) { Note.create!(name: 'test') }
  let(:tag) { Note.create!(name: 'test', note: note) }

  describe '.create' do
    it 'should validate the presence of name' do
      expect { Tag.create!(name: nil, note: note) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate the presence of note' do
      expect { Tag.create!(name: 'test', note: nil) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
