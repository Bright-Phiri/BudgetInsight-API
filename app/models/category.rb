# frozen_string_literal: true

class Category < ApplicationRecord
  VALID_CATEGORIES = ['Labor', 'Materials', 'Utilities', 'Furniture'].freeze
  validates :name, presence: true, inclusion: { in: VALID_CATEGORIES }
  has_many :expenses
end
