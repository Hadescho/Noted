class NotesController
  class << self
    def create(args = {})
      Note.create!(args)
    end

    def index
      Note.all
    end
  end
end
