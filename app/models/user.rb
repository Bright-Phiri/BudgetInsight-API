# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_secure_password
  attr_readonly :projects_count
  validates :password, length: { in: 6..8 }
  with_options presence: true do
    validates :user_name, uniqueness: true, format: { without: /\s/, message: ' must contain no spaces' }
    validates :email, uniqueness: { case_sensitive: false }
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'is invalid' }
  end
end
