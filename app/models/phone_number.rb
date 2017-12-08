class PhoneNumber < ApplicationRecord
 belongs_to :person

 validates :number, uniqueness: true,
                    length: {minimum: 5}

end
