require 'noted/console'

describe Noted::Console do
  describe '#perform' do
    context 'when command is add' do
      let(:console) { Noted::Console.new('add') }

      context 'and there is no name' do
        it 'should raise RecordInvalid' do
          console.options[:name] = nil
          expect { console.perform }.to raise_error ActiveRecord::RecordInvalid
        end
      end

      context 'and there is name given' do
        it 'should create a record' do
          console.options[:name] = 'Test1'
          expect { console.perform }.to change { Note.count }.by(1)
        end
      end

      context 'and there are name and tags added' do
        it 'should raise the Tag.count' do
          console.options[:name] = 'Test2'
          console.add_tag('Tag1')
          console.add_tag('Tag2')
          expect { console.perform }.to change { Tag.count }.by(2)
        end
      end
    end

    context 'when command is delete' do
      let(:console) { Noted::Console.new('del') }

      context 'and there is no name given' do
        it 'should raise RecordNotFound' do
          expect { console.perform }.to raise_error ActiveRecord::RecordNotFound
        end
      end
      context 'and there is name' do
        before(:each) { Note.create(name: 'ToBeDeleted') }

        it 'should delete the Note' do
          console.options[:name] = 'ToBeDeleted'
          console.options
          expect { console.perform }.to change { Note.count }.by(-1)
        end
      end
    end

    context 'when command is list' do
    end

    context 'when command is edit' do
    end
  end
end
