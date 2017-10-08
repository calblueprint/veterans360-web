class Admin < ApplicationRecord
  has_many :resources, as: :benefactor
end
