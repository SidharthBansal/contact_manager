class PhoneNumber < ApplicationRecord
 belongs_to :person

 validates :number, presence: true, uniqueness: true,
                    length: {minimum: 5}

end
