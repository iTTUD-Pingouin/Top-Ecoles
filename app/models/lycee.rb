class Lycee < ApplicationRecord
  belongs_to :school
  has_many :filieres, dependent: :destroy

end
