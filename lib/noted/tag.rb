# frozen_string_literal: true
require 'active_record'

class Tag < ActiveRecord::Base
  belongs_to :note

  validates :name, presence: true
end
