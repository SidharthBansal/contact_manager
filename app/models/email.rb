class Email < ApplicationRecord
  before_save :downcase_email

  belongs_to :person

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 255 },
                    format: {with: VALID_EMAIL_REGEX }

  private

    def downcase_email
      self.email.downcase!
    end
end
