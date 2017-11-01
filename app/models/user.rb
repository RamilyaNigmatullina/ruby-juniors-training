class User < ApplicationRecord
  enum role: {
    admin: "admin",
    user: "user"
  }

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
end
