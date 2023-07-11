# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :expenses
  attr_readonly :expenses_count
end
