require 'noted/note'
require 'noted/notes_controller'

describe NotesController do
  describe '.create' do
    context 'when given name' do
      it 'should create notes' do
        expect { NotesController.new.create(name: 'test') }
          .to change { Note.count }.by(1)
      end
    end

    context 'when given no name' do
      it 'should not create notes' do
        expect { NotesController.new.create({}) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe '.index' do
    it 'should return all notes' do
      expect(NotesController.new.index.count).to eq Note.count
    end
  end
end
