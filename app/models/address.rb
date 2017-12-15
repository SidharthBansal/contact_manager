class Address < ApplicationRecord

  belongs_to :person

  validates :postcode, numericality: { greater_than_or_equal_to: 10000,
                                       less_than_or_equal_to: 99999999,
                                       only_integer: true }

  validates :city, length: {maximum: 15 },
                            format: {with: /\A[a-zA-Z\s]+\z/,
                            message: "Only allows letters"}
  validates :country, length: {maximum: 15 },
                      format: {with: /\A[a-zA-Z\s]+\z/,
                              message: "Only allows letters"}
  validates :state, length: {maximum: 15 },
                    format: {with: /\A[a-zA-Z\s]+\z/,
                            message: "Only allows letters"}
end
