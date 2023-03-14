class Event < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
