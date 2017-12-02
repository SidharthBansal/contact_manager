class PhoneNumber < ApplicationRecord
 belongs_to :person, dependent: :destroy

 validates :number, presence: true, uniqueness: true,
                    length: {minimum: 5}

end
