class Employee < ActiveRecord::Base

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :first_name,
            :last_name,
            :street,
            :house_number,
            :zip_code,
            :city,
            :presence => true

end
