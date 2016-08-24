require 'noted/console'

describe Noted::Console do
  describe '#perform' do
    context 'when command is add' do
      let(:console) { Noted::Console.new('add') }
      context 'and the options are correct' do
        it 'should create a record' do
          console.options = { name: 'Test' }
          expect { console.perform }.to change { Note.count }.by(1)
        end
      end
    end

    context 'when command is delete' do
    end

    context 'when command is list' do
    end

    context 'when command is edit' do
    end
  end
end
