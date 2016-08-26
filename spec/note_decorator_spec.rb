# frozen_string_literal: true
require 'noted/note'
require 'noted/note_decorator'
require 'noted/renderer/measurements'

describe NoteDecorator do
  let(:note) { Note.create(name: 'DecoratedNote') }
  let(:decorator) { note.decorate(nil, nil) }
  describe '#method_missing' do
    it 'should respond to note\'s methods' do
      expect(decorator.name).to eq note.name
    end
  end

  describe '#respond_to_missing' do
    it 'should respond_to note\'s methods' do
      expect(decorator.respond_to?(:name)).to be true
    end
  end

  describe '#original' do
    it 'should return the original object' do
      expect(decorator.original).to eq note
    end
  end

  # TODO: make sure to stub the system call for the measurements
  # Should have used FactoryGirl, because this is starting to get ridiculous
  let(:full_stack_note) do
    tag1 = Tag.new(name: 'TagTest1')
    tag2 = Tag.new(name: 'TagTest2')
    note = Note.new(name: 'FullNote', priority: 42,
                    description: 'This is a description')
    note.tags << tag1
    note.tags << tag2
    note
  end

  let(:full_stack_decorator) do
    color_pair = {fg: :white, bg: :black}
    measurements = Noted::Renderer::Measurements.new()
    NoteDecorator.new(full_stack_note, color_pair, measurements)
  end

  describe '#line' do
    subject { full_stack_decorator.line }

    it { is_expected.to include full_stack_note.name }
    it { is_expected.to include full_stack_note.description }
    it { is_expected.to include full_stack_note.tags.first.name }
    it { is_expected.to include full_stack_note.tags.last.name }
    it { is_expected.to include full_stack_note.priority.to_s }
  end

  describe '#tag_names' do
    subject { full_stack_decorator.tag_names }

    it { is_expected.to include full_stack_note.tags.first.name }
    it { is_expected.to include full_stack_note.tags.last.name }
  end
end
