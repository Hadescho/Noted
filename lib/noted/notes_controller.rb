class NotesController
  class << self
    def create(args = {})
      Note.create!(args)
    end
  end
end
