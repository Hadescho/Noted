# frozen_string_literal: true
require 'active_record'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  # has_many :note_users
  # has_many :notes, through: :note_users

end
