class Person < ApplicationRecord
  belongs_to :user
  has_many :phone_numbers, dependent: :destroy
  has_many :emails, dependent: :destroy

  default_scope -> { order(:first_name) }

  before_save :nameify

  validates :first_name, presence: true,
                         length: {minimum: 3, maximum: 50},
                         format: {with: /\A[a-zA-Z]+\z/,
                                  message: "Only allows letters"}
  validates :last_name, presence: true,
                        length: {minimum: 3, maximum: 50},
                        format: {with: /\A[a-zA-Z]+\z/,
                                 message: "Only allows letters"},
                        allow_blank: true

  validates :user_id, presence: true

  private

    def nameify
      self.first_name = self.first_name.downcase.capitalize
      self.last_name = self.last_name.downcase.capitalize
    end

end
