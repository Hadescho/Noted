require 'noted/note'
require 'noted/notes_controller'

describe NotesController do
  before(:all) { Note.create(name: 'Test') }
  after(:all) { Note.destroy_all }
  describe '#create' do
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

  describe '#index' do
    it 'should return all notes' do
      expect(NotesController.new.index.count).to eq Note.count
    end
  end

  describe '#edit' do
    context 'when given no arguments' do
      it 'should raise an exception' do
        expect { NotesController.new.edit({}) }
          .to raise_error ArgumentError
      end
    end
    context 'when given arguments' do
      context 'when given only id' do
        it 'shouldn\'t do anything' do
          expect { NotesController.new.edit(id: 1).not_to change Note.first }
        end
      end

      context 'when given additional arguments' do
        it 'should change the object' do
          params = {
            id: Note.first.id,
            name: Note.first.name,
            description: 'Desc added'
          }
          expect { NotesController.new.edit(params) }
            .to change { Note.first.description }.from(nil)
            .to(params[:description])
        end
      end
    end

    describe '#delete' do
      context 'when given id' do
        it 'should delete the record' do
          id = Note.first.id
          expect { NotesController.new.delete(id: id) }
            .to change { Note.count }.by(-1)
        end
      end
    end
  end
end
