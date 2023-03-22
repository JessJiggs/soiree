class Task < ApplicationRecord
  belongs_to :event
  has_many :assignments, dependent: :destroy
  has_many :collaborations, through: :assignments
  has_many :users, through: :collaborations
  acts_as_taggable_on :categories
  enum :status, %i[to_do doing done]

end
