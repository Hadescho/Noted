require 'noted/note'
require 'noted/notes_controller'

describe NotesController do
  describe '.create' do
    context 'when given name' do
      it 'should create notes' do
        expect { NotesController.create(name: 'test') }
          .to change { Note.count }.by(1)
      end
    end

    context 'when given no name' do
      it 'should not create notes' do
        expect { NotesController.create({}) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
