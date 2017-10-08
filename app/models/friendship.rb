class Friendship < ApplicationRecord
  belongs_to :veteran
  belongs_to :friend, class_name: 'Veteran'
end
