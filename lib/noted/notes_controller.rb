class NotesController
  def create(args = {})
    Note.create!(args)
  end

  def index
    Note.all
  end

  def edit(args = {})
    Note.find_by_name!(args[:name]).update_attributes(args)
  end

  def delete(args = {})
    Note.find_by_name!(args[:name]).destroy
  end
end
