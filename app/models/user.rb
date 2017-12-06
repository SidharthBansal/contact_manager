class User < ApplicationRecord
  attr_accessor :remember_token

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


  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token =
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  private

   def downcase_email
     self.email.downcase!
   end
end


user = User.new(username: "batman", email: "batman@email.com",
                password: "foobar", password_confirmation: "foobar")
