class Person < ApplicationRecord

  validates :first_name, presence: true,
                         length: {minimum: 3, maximum: 50},
                         format: {with: /\A[a-zA-Z]+\z/,
                                  message: "Only allows letters"}
  validates :last_name, presence: true,
                        length: {minimum: 3, maximum: 50},
                        format: {with: /\A[a-zA-Z]+\z/,
                                 message: "Only allows letters"}

end
