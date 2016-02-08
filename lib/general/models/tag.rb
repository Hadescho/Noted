require 'active_record'

class Tag < ActiveRecord::Base
  belongs_to :note

  validates :name, :note, presence: true
end
