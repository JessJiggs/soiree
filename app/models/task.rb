class Task < ApplicationRecord
  belongs_to :event
  has_many :assignments, dependent: :destroy
end
