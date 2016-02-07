class CreateNote < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.text :description
      t.integer :priority

      t.timestamps null: true
    end
  end
end
