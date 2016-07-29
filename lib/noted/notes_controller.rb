class NotesController
  def create(args = {})
    Note.create!(args)
  end

  def index
    Note.all
  end
end
