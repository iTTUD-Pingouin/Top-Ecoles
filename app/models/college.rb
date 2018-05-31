class College < ApplicationRecord
  belongs_to :school
  searchkick
end
