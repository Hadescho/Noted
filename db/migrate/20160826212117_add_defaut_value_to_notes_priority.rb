class AddDefautValueToNotesPriority < ActiveRecord::Migration[5.0]
  def change
    change_column :notes, :priority, :integer, default: 0
  end
end
