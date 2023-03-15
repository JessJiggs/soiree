class Task < ApplicationRecord
  belongs_to :event
  has_many :assignments, dependent: :destroy

  enum :status, %i[to_do doing done]
end
