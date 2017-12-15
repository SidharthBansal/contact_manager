class Address < ApplicationRecord

  belongs_to :person

  validates :postcode, length: { maximum: 8 }

end
