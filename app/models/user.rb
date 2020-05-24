class User < ApplicationRecord

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :username, presence: true, length: {minimum: 3, maximum: 25},
            uniqueness: {case_sensitive: false}
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}


  has_many :articles


  before_save {
    self.email = email.downcase
  }

end