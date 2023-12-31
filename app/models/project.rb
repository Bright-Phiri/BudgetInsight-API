# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :expenses, dependent: :destroy
  attr_readonly :expenses_count
  validates :name, :description, :start_date, :end_date, presence: true
  validates :start_date, comparison: { less_than: :end_date }
end
