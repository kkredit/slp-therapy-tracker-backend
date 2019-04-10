class Provider < ApplicationRecord
  validates :fname, :lname, presence: true, length: {minimum: 1, maximum: 20}
  validates :username, presence: true, length: {minimum: 5, maximum: 20},
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  has_many :sessions
end
