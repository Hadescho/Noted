require "active_record"

class Note < ActiveRecord::Base
  validates :name, presence: true
  has_many :tags
end
