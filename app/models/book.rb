# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, presence: true
end
