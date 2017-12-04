class User < ApplicationRecord
  before_save :downcase_email
  validates :username, presence: true, uniqueness: true,
                       length: {minimum: 3, maximum: 20},
                       format: {with: /\A[\w]+\z/ }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,    presence: true, uniqueness: true,
                       length: { maximum: 255 },
                       format: {with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}


  validates :password_confirmation, presence: true, length: {minimum: 6}
  private

   def downcase_email
     self.email.downcase!
   end
end
