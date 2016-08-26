# frozen_string_literal: true
class NotesController
  def create(args = {})
    Note.create!(args)
  end

  def index(args = {})
    if args.values.all?(&:blank?)
      @notes = Note.all
    else
      @notes = Note.where(note_params(args))
    end
    Noted::Renderer.new(@notes).render
  end

  # TODO: Extract logic somewhere else
  def edit(args = {})
    note = Note.find_by_name!(args[:name])
    note.update_attributes!(note_params(args))
  end

  def delete(args = {})
    Note.find_by_name!(args[:name]).destroy
  end

  private

  def note_params(args)
    new_params = args.clone.except(:new_name)
    new_params[:name] = args[:new_name] if args[:new_name]
    new_params
  end
end
