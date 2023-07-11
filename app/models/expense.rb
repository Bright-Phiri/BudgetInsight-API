# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :project, counter_cache: true
end
