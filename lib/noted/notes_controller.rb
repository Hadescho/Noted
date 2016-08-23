class NotesController
  def create(args = {})
    Note.create!(args)
  end

  def index
    Note.all
  end

  def edit(args = {})
    Note.find_by_id_or_name(args).update_attributes(args)
  end

  def delete(args = {})
    Note.find_by_id_or_name(args).destroy
  end
end
