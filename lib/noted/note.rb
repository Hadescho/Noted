# frozen_string_literal: true
require 'active_record'

class Note < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :tags
  accepts_nested_attributes_for :tags,
                                reject_if: (lambda do |attributes|
                                  attributes[:name].blank?
                                end)

  def self.find_by_id_or_name(id: nil, name: nil, **_)
    return find_by_id(id) if id
    return find_by_name(name) if name
    raise  ArgumentError, 'You should give id or name kwarg'
  end
end
