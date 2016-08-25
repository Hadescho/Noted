class NotesController

  def create(args = {})
    Note.create!(args)
  end

  def index
    Note.all
  end

  # TODO Extract logic somewhere else
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
   new_params.merge!({name: args[:new_name]}) if args[:new_name]
   new_params
  end
end
