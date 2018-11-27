class Publication < ApplicationRecord
  # Direct associations

  belongs_to :publication,
             :class_name => "User"

  # Indirect associations

  # Validations

end
