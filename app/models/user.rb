class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  enum role: { user: "user", admin: "admin" }

  validates :full_name, presence: true
  validates :role, presence: true
end
