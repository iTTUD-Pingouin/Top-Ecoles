class School < ApplicationRecord
  has_one :college
  has_one :primaire

end
