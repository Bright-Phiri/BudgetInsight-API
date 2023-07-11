# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects
  attr_readonly :projects_count
end
