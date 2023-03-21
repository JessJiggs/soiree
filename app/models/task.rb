class Task < ApplicationRecord
  belongs_to :event
  has_many :assignments, dependent: :destroy
  acts_as_taggable_on :categories
  enum :status, %i[to_do doing done]

end
