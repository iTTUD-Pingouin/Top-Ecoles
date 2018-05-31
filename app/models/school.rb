class School < ApplicationRecord
  has_one :college
  has_one :primaire
  has_one :lycee

  searchkick
end
