class Task < ApplicationRecord
  belongs_to :event
  has_many :assignments, dependent: :destroy

  enum :status, [ :to_do, :doing, :done ]
end
