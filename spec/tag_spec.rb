# frozen_string_literal: true
require 'active_record_spec_helper.rb'

require 'noted/tag'
require 'noted/note'

describe Tag do
  let(:note) { Note.create!(name: 'test') }
  let(:tag) { Tag.create!(name: 'test', note: note) }

  describe '.create' do
    it 'should validate the presence of name' do
      expect { Tag.create!(name: nil, note: note) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#note' do
    it 'should be able to access it\'s note' do
      expect(tag).to respond_to(:note)
    end
  end
end
