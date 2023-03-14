class Event < ApplicationRecord
  has_many :collaborations, dependent: :destroy
end
