# frozen_string_literal: true
require 'active_record'

class Note < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :tags
  accepts_nested_attributes_for :tags,
                                reject_if: (lambda do |attributes|
                                  attributes[:name].blank?
                                end)

  def decorate(color_pair, measurements)
    NoteDecorator.new(self, color_pair, measurements)
  end

end
